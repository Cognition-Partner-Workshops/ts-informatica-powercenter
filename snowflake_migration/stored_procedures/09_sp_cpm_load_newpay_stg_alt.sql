-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_ALT
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL
--
-- Flow: CPM_PM3_STG_TBL -> exp_Initial -> lkp_PSEUDOSSN_TBL
--       -> exp_Determine_Allotments (complex stateful allotment tracking)
--       -> agg_Allotments (GROUP BY PYF_EYE_ID_PDT3, aggregate FIRST/LAST)
--       -> exp_Convert (numeric precision conversion)
--       -> exp_Final -> CPM_NEWPAY_STG_ALT_TBL
--
-- Error path: fil_Bad_Records -> nrm_Errors -> fil_Error_Message -> ERROR_TBL
--
-- Key logic: Tracks up to 7 allotments per employee using stateful counters.
--   DDL defines ALT_1, ALT_2, ALT_4-ALT_8 (no ALT_3; original VSAM skip).
--   Uses DECODE/IIF to assign allotment fields based on the running
--   allotment counter per employee (PYF_EYE_ID_PDT3).
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_NEWPAY_STG_ALT(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- The original Informatica mapping uses a stateful Expression transformation
    -- (exp_Determine_Allotments) to track allotment counters per employee.
    -- In Snowflake, we replicate this with ROW_NUMBER() and PIVOT logic.

    -- Step 1: Assign allotment sequence numbers per employee
    CREATE OR REPLACE TEMPORARY TABLE TMP_ALLOTMENT_NUMBERED AS
    SELECT
        pm3.PYF_EYE_ID_PDT3,
        pm3.PP_END_YEAR,
        pm3.PP_NUM,
        -- Lookup PSEUDOSSN_TBL for real SSN resolution
        COALESCE(ps.SSN, pm3.PYF_EYE_ID_PDT3) AS RESOLVED_SSN,
        pm3.PYF_PAY_DET_CD  AS PAY_DET_CD,
        pm3.PYF_DDU_PYE     AS INST_ACCT_NO,
        pm3.PYF_ACTUAL_AMT  AS ALLOTMENT_AMT,
        pm3.PYF_ITW_MS      AS ACCT_TYPE,
        COALESCE(NULLIF(TRIM(pm3.PFY_ID_BREAK_SSN), ''), ' ') AS EE_ACCT_NO,
        ROW_NUMBER() OVER (
            PARTITION BY pm3.PYF_EYE_ID_PDT3
            ORDER BY pm3.PYF_GEN_SEQ_ID
        ) AS ALLOTMENT_NUM
    FROM CPM_PM3_STG_TBL pm3
    LEFT JOIN PSEUDOSSN_TBL ps
        ON ps.PSEUDOSSN = pm3.PYF_EYE_ID_PDT3
    WHERE pm3.PP_END_YEAR = :P_PP_END_YEAR
      AND pm3.PP_NUM = :P_PP_NUM;

    -- Step 2: Pivot allotments into the target structure (up to 7 per employee)
    -- DDL has ALT_1, ALT_2, ALT_4-ALT_8 (no ALT_3 per original VSAM layout)
    -- Each group has 6 columns: INST_AC_NO, ROUTE_ID, ROUTE_DIGIT, DED, EE_ACCT_NO, ACCT_TYPE
    INSERT INTO CPM_NEWPAY_STG_ALT_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN, PYF_PAY_DET_CD,
        ALT_1_INST_AC_NO, ALT_1_ROUTE_ID, ALT_1_ROUTE_DIGIT, CPP_ALT_1_DED, ALT_1_EE_ACCT_NO, ALT_1_ACCT_TYPE,
        ALT_2_INST_ACCT_NO, ALT_2_ROUTE_ID, ALT_2_ROUTE_DIGIT, CPP_ALT_2_DED, ALT_2_EE_ACCT_NO, ALT_2_ACCT_TYPE,
        ALT_4_INST_AC_NO, ALT_4_ROUTE_ID, ALT_4_ROUTE_DIGIT, CPP_ALT_4_DED, ALT_4_EE_ACCT_NO, ALT_4_ACCT_TYPE,
        ALT_5_INST_AC_NO, ALT_5_ROUTE_ID, ALT_5_ROUTE_DIGIT, CPP_ALT_5_DED, ALT_5_EE_ACCT_NO, ALT_5_ACCT_TYPE,
        ALT_6_INST_AC_NO, ALT_6_ROUTE_ID, ALT_6_ROUTE_DIGIT, CPP_ALT_6_DED, ALT_6_EE_ACCT_NO, ALT_6_ACCT_TYPE,
        ALT_7_INST_AC_NO, ALT_7_ROUTE_ID, ALT_7_ROUTE_DIGIT, CPP_ALT_7_DED, ALT_7_EE_ACCT_NO, ALT_7_ACCT_TYPE,
        ALT_8_INST_AC_NO, ALT_8_ROUTE_ID, ALT_8_ROUTE_DIGIT, CPP_ALT_8_DED, ALT_8_EE_ACCT_NO, ALT_8_ACCT_TYPE
    )
    SELECT
        PP_END_YEAR, PP_NUM, PYF_EYE_ID_PDT3,
        MAX(PAY_DET_CD),
        -- ALT_1 (ALLOTMENT_NUM = 1)
        MAX(CASE WHEN ALLOTMENT_NUM = 1 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 1 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 1 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 1 THEN ACCT_TYPE END),
        -- ALT_2 (ALLOTMENT_NUM = 2)
        MAX(CASE WHEN ALLOTMENT_NUM = 2 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 2 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 2 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 2 THEN ACCT_TYPE END),
        -- ALT_4 (ALLOTMENT_NUM = 3; DDL skips ALT_3)
        MAX(CASE WHEN ALLOTMENT_NUM = 3 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 3 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 3 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 3 THEN ACCT_TYPE END),
        -- ALT_5 (ALLOTMENT_NUM = 4)
        MAX(CASE WHEN ALLOTMENT_NUM = 4 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 4 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 4 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 4 THEN ACCT_TYPE END),
        -- ALT_6 (ALLOTMENT_NUM = 5)
        MAX(CASE WHEN ALLOTMENT_NUM = 5 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 5 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 5 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 5 THEN ACCT_TYPE END),
        -- ALT_7 (ALLOTMENT_NUM = 6)
        MAX(CASE WHEN ALLOTMENT_NUM = 6 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 6 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 6 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 6 THEN ACCT_TYPE END),
        -- ALT_8 (ALLOTMENT_NUM = 7)
        MAX(CASE WHEN ALLOTMENT_NUM = 7 THEN INST_ACCT_NO END),
        NULL, NULL,
        COALESCE(MAX(CASE WHEN ALLOTMENT_NUM = 7 THEN ALLOTMENT_AMT END), 0),
        MAX(CASE WHEN ALLOTMENT_NUM = 7 THEN EE_ACCT_NO END),
        MAX(CASE WHEN ALLOTMENT_NUM = 7 THEN ACCT_TYPE END)
    FROM TMP_ALLOTMENT_NUMBERED
    GROUP BY PP_END_YEAR, PP_NUM, PYF_EYE_ID_PDT3;

    -- Error handling: Log records where allotment count exceeds 7 (DDL max)
    INSERT INTO ERROR_TBL (
        PROCESS_NAME, ERROR_MESSAGE,
        SOURCE_KEY, ERROR_DATE, PP_END_YEAR, PP_NUM
    )
    SELECT
        'SP_CPM_LOAD_NEWPAY_STG_ALT',
        'Employee has more than 7 allotments: ' || PYF_EYE_ID_PDT3,
        PYF_EYE_ID_PDT3,
        CURRENT_DATE(),
        PP_END_YEAR,
        PP_NUM
    FROM TMP_ALLOTMENT_NUMBERED
    WHERE ALLOTMENT_NUM > 7
    GROUP BY PYF_EYE_ID_PDT3, PP_END_YEAR, PP_NUM;

    DROP TABLE IF EXISTS TMP_ALLOTMENT_NUMBERED;

    RETURN 'NEWPAY STG ALT load complete';
END;
$$;
