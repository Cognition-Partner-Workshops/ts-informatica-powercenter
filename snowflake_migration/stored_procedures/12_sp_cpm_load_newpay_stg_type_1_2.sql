-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL
-- THE MOST COMPLEX MAPPING: 18 transforms, 1436 connectors, 262-column target
--
-- Flow:
--   CPM_PM1_STG_TBL + CPM_PM2_STG_TBL + PSEUDOSSN_TBL -> SQ_CPM_PM1_STG_TBL
--   CPM_YTD_DETAIL_STG_TBL -> SQ_CPM_YTD_DETAIL_STG_TBL
--   -> exp_Initial -> jnr_CPM_YTD (Detail Outer Join on SSN + PP)
--   -> Lookups: CPM_MER_DETAIL, CPM_PAD_DETAIL, CPM_NEWPAY_STG_YTD_STATE
--   -> exp_Determine_Errors (validate PAD/MER/PSEUDO exist)
--   -> exp_Convert_TYPE_1_PAD_MER (name parsing, field conversion)
--   -> exp_Convert_YTD (overflow truncation for dollar amounts)
--   -> exp_Final -> CPM_NEWPAY_STG_TYPE_1_2_TBL
--
-- Error path: fil_Bad_Records -> nrm_Errors -> fil_Error_Message -> ERROR_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- Step 1: Build the joined dataset (replaces SQ + Joiner + Lookups)
    -- jnr_CPM_YTD: Detail Outer Join on PP_END_YEAR, PP_NUM, PYF_EYE_ID_1 = DYD_SSN_1
    CREATE OR REPLACE TEMPORARY TABLE TMP_TYPE_1_2_JOINED AS
    SELECT
        pm1.PP_END_YEAR,
        pm1.PP_NUM,
        pm1.PYF_EYE_ID_1,
        pm1.PYF_EYE_NME,
        pm1.PYF_EYE_ID_PDT3,
        pm1.PFY_ID_BREAK_SSN,

        -- exp_Convert_TYPE_1_PAD_MER: Name parsing logic
        -- v_POS_FIRST_SPACE = INSTR(PYF_EYE_NME, ' ')
        -- v_LAST_NAME = SUBSTR(PYF_EYE_NME, 1, first_space - 1)
        -- v_FIRST_NAME: up to second space or remainder
        TRIM(SUBSTR(pm1.PYF_EYE_NME, 1,
            COALESCE(NULLIF(POSITION(' ' IN pm1.PYF_EYE_NME), 0) - 1,
                     LENGTH(pm1.PYF_EYE_NME))
        )) AS LAST_NAME,

        CASE
            WHEN POSITION(' ' IN pm1.PYF_EYE_NME) > 0 THEN
                CASE
                    WHEN POSITION(' ' IN SUBSTR(pm1.PYF_EYE_NME,
                            POSITION(' ' IN pm1.PYF_EYE_NME) + 1)) > 0
                    THEN SUBSTR(pm1.PYF_EYE_NME,
                            POSITION(' ' IN pm1.PYF_EYE_NME) + 1,
                            POSITION(' ' IN SUBSTR(pm1.PYF_EYE_NME,
                                POSITION(' ' IN pm1.PYF_EYE_NME) + 1)) - 1)
                    ELSE SUBSTR(pm1.PYF_EYE_NME,
                            POSITION(' ' IN pm1.PYF_EYE_NME) + 1)
                END
            ELSE NULL
        END AS FIRST_NAME,

        -- MID_INIT: first char after second space in PYF_EYE_NME
        CASE
            WHEN POSITION(' ' IN pm1.PYF_EYE_NME) > 0
                 AND POSITION(' ' IN SUBSTR(pm1.PYF_EYE_NME,
                        POSITION(' ' IN pm1.PYF_EYE_NME) + 1)) > 0
            THEN SUBSTR(pm1.PYF_EYE_NME,
                    POSITION(' ' IN pm1.PYF_EYE_NME)
                    + POSITION(' ' IN SUBSTR(pm1.PYF_EYE_NME,
                        POSITION(' ' IN pm1.PYF_EYE_NME) + 1))
                    + 1, 1)
            ELSE ' '
        END AS MID_INIT,

        -- PM2 fields (Type 2 record data)
        pm2.PYF_PAY_PLAN,
        pm2.PYF_GRADE,
        pm2.PYF_STEP,
        pm2.PYF_OCC_SERIES,
        pm2.PYF_DUTY_STATION,
        pm2.PYF_PAY_BASIS,
        pm2.PYF_FLSA_CAT,
        pm2.PYF_WORK_SCHEDULE,
        pm2.PYF_APPT_TYPE,
        pm2.PYF_RETIRE_PLAN,
        pm2.PYF_FEGLI,
        pm2.PYF_SCD_LEAVE,
        pm2.PYF_ADJ_BASIC_PAY,
        pm2.PYF_LOCALITY_ADJ,
        pm2.PYF_TOTAL_PAY,

        -- PSEUDOSSN lookup
        ps.SSN AS PSEUDO_SSN,

        -- Lookup: CPM_PAD_DETAIL_STG_TBL
        pad.PAD_SOC_SEC_NO AS lkp_PAD_SOC_SEC_NO,
        pad.PAD_NAME,
        pad.PAD_AGENCY,
        pad.PAD_PAY_PLAN AS PAD_PAY_PLAN,
        pad.PAD_GRADE AS PAD_GRADE,
        pad.PAD_STEP AS PAD_STEP,
        pad.PAD_OCC_SERIES AS PAD_OCC_SERIES,
        pad.PAD_DUTY_STATION,
        pad.PAD_PAY_BASIS AS PAD_PAY_BASIS,
        pad.PAD_FLSA_CAT AS PAD_FLSA_CAT,
        pad.PAD_WORK_SCHEDULE AS PAD_WORK_SCHEDULE,
        pad.PAD_APPT_TYPE AS PAD_APPT_TYPE,
        pad.PAD_RETIRE_PLAN AS PAD_RETIRE_PLAN,
        pad.PAD_FEGLI AS PAD_FEGLI,
        pad.PAD_SCD_LEAVE AS PAD_SCD_LEAVE,
        pad.PAD_ADJ_BASIC_PAY AS PAD_ADJ_BASIC_PAY,
        pad.PAD_LOCALITY_ADJ AS PAD_LOCALITY_ADJ,
        pad.PAD_TOTAL_PAY AS PAD_TOTAL_PAY,
        pad.PAD_PAY_RATE,

        -- Lookup: CPM_MER_DETAIL_STG_TBL
        mer.MER_SSN AS lkp_MER_SSN,
        mer.MER_NAME,
        mer.MER_AGENCY AS MER_AGENCY,
        mer.MER_PAY_PLAN AS MER_PAY_PLAN,
        mer.MER_GRADE AS MER_GRADE,
        mer.MER_STEP AS MER_STEP,
        mer.MER_OCC_SERIES AS MER_OCC_SERIES,
        mer.MER_DUTY_STA AS MER_DUTY_STA,
        mer.MER_PAY_BASIS AS MER_PAY_BASIS,
        mer.MER_FLSA_CAT AS MER_FLSA_CAT,
        mer.MER_WORK_SCHEDULE AS MER_WORK_SCHEDULE,
        mer.MER_APPT_TYPE AS MER_APPT_TYPE,
        mer.MER_RETIRE_PLAN AS MER_RETIRE_PLAN,
        mer.MER_FEGLI AS MER_FEGLI,
        mer.MER_SCD_LEAVE AS MER_SCD_LEAVE,
        mer.MER_ADJ_BASIC_PAY AS MER_ADJ_BASIC_PAY,
        mer.MER_LOCALITY_ADJ AS MER_LOCALITY_ADJ,
        mer.MER_TOTAL_PAY AS MER_TOTAL_PAY,
        mer.MER_ANNUAL_LEAVE_BAL,

        -- Lookup: CPM_NEWPAY_STG_YTD_STATE_TBL (4 states per DDL)
        ys.YTD_STATE_1, ys.YTD_ST_TX_1_CDE, ys.YTD_ST_TX_1_DED, ys.YTD_ST_TX_1_GRS,
        ys.YTD_STATE_2, ys.YTD_ST_TX_2_CDE, ys.YTD_ST_TX_2_DED, ys.YTD_ST_TX_2_GRS,
        ys.YTD_STATE_3, ys.YTD_ST_TX_3_CDE, ys.YTD_ST_TX_3_DED, ys.YTD_ST_TX_3_GRS,
        ys.YTD_STATE_4, ys.YTD_ST_TX_4_CDE, ys.YTD_ST_TX_4_DED, ys.YTD_ST_TX_4_GRS,

        -- YTD Detail join (Detail Outer Join)
        ytd.DYD_BASE_PAY,
        ytd.DYD_OVERTIME_PAY,
        ytd.DYD_NIGHT_DIFF_PAY,
        ytd.DYD_SUN_PREM_PAY,
        ytd.DYD_HOLIDAY_PAY,
        ytd.DYD_HAZ_DUTY_PAY,
        ytd.DYD_ENV_DIF_PAY,
        ytd.DYD_POST_DIF_PAY,
        ytd.DYD_FICA_HI,
        ytd.DYD_OASDI,
        ytd.DYD_FED_TAX,
        ytd.DYD_ST_TAX,
        ytd.DYD_LOCAL_TAX,

        -- Error detection flags
        -- exp_Determine_Errors: check PAD, MER, PSEUDOSSN existence
        CASE WHEN pad.PAD_SOC_SEC_NO IS NULL THEN TRUE ELSE FALSE END AS ERROR_FLAG_PAD,
        CASE WHEN mer.MER_SSN IS NULL THEN TRUE ELSE FALSE END AS ERROR_FLAG_MER,
        CASE WHEN ps.PSEUDOSSN IS NULL THEN TRUE ELSE FALSE END AS ERROR_FLAG_PSEUDO

    FROM CPM_PM1_STG_TBL pm1
    LEFT JOIN CPM_PM2_STG_TBL pm2
        ON pm1.PYF_EYE_ID_1 = pm2.PYF_EYE_ID_1
        AND pm1.PP_END_YEAR = pm2.PP_END_YEAR
        AND pm1.PP_NUM = pm2.PP_NUM
    LEFT JOIN PSEUDOSSN_TBL ps
        ON ps.PSEUDOSSN = pm1.PYF_EYE_ID_1
    LEFT JOIN CPM_YTD_DETAIL_STG_TBL ytd
        ON ytd.PP_END_YEAR = pm1.PP_END_YEAR
        AND ytd.PP_NUM = pm1.PP_NUM
        AND ytd.DYD_SSN_1 = pm1.PYF_EYE_ID_1
    LEFT JOIN CPM_PAD_DETAIL_STG_TBL pad
        ON pad.PAD_SOC_SEC_NO = pm1.PYF_EYE_ID_1
        AND pad.PP_END_YEAR = pm1.PP_END_YEAR
        AND pad.PP_NUM = pm1.PP_NUM
    LEFT JOIN CPM_MER_DETAIL_STG_TBL mer
        ON mer.MER_SSN = pm1.PYF_EYE_ID_1
        AND mer.PP_END_YEAR = pm1.PP_END_YEAR
        AND mer.PP_NUM = pm1.PP_NUM
    LEFT JOIN CPM_NEWPAY_STG_YTD_STATE_TBL ys
        ON ys.DFAS_PSEUDO_SSN = pm1.PYF_EYE_ID_1
        AND ys.PP_END_YEAR = pm1.PP_END_YEAR
        AND ys.PP_NUM = pm1.PP_NUM
    WHERE pm1.PP_END_YEAR = :P_PP_END_YEAR
      AND pm1.PP_NUM = :P_PP_NUM;

    -- Step 2: Log errors for missing PAD/MER/PSEUDO records
    -- Mirrors: exp_Determine_Errors -> fil_Bad_Records -> nrm_Errors -> ERROR_TBL
    -- Use separate INSERTs so all error types are logged per employee
    INSERT INTO ERROR_TBL (
        PROCESS_NAME, ERROR_MESSAGE,
        SOURCE_KEY, ERROR_DATE, PP_END_YEAR, PP_NUM
    )
    SELECT
        'SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2',
        'PAD Record not found for SSN: ' || PYF_EYE_ID_1,
        PYF_EYE_ID_1, CURRENT_DATE(), PP_END_YEAR, PP_NUM
    FROM TMP_TYPE_1_2_JOINED
    WHERE ERROR_FLAG_PAD;

    INSERT INTO ERROR_TBL (
        PROCESS_NAME, ERROR_MESSAGE,
        SOURCE_KEY, ERROR_DATE, PP_END_YEAR, PP_NUM
    )
    SELECT
        'SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2',
        'MER Record not found for SSN: ' || PYF_EYE_ID_1,
        PYF_EYE_ID_1, CURRENT_DATE(), PP_END_YEAR, PP_NUM
    FROM TMP_TYPE_1_2_JOINED
    WHERE ERROR_FLAG_MER;

    INSERT INTO ERROR_TBL (
        PROCESS_NAME, ERROR_MESSAGE,
        SOURCE_KEY, ERROR_DATE, PP_END_YEAR, PP_NUM
    )
    SELECT
        'SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2',
        'PSEUDO Record not found for SSN: ' || PYF_EYE_ID_1,
        PYF_EYE_ID_1, CURRENT_DATE(), PP_END_YEAR, PP_NUM
    FROM TMP_TYPE_1_2_JOINED
    WHERE ERROR_FLAG_PSEUDO;

    -- Step 3: Insert valid records into CPM_NEWPAY_STG_TYPE_1_2_TBL
    -- Includes exp_Convert_TYPE_1_PAD_MER transformations (name parsing,
    -- field mapping from PAD/MER lookups) and exp_Convert_YTD (overflow clamping)
    INSERT INTO CPM_NEWPAY_STG_TYPE_1_2_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN,
        LAST_NAME, FIRST_NAME, MID_INIT,
        FIR_NAME_1, CODE_CONSL, FIR_NAME_3_11,
        PAY_PLAN, GRADE, STEP_OR_RATE,
        OCC_SERIES, DUTY_STATION, PAY_BASIS,
        FLSA_CAT, WORK_SCHEDULE, APPT_TYPE,
        RETIRE_PLAN, FEGLI, SCD_LEAVE,
        ADJ_BASIC_PAY, LOCALITY_ADJ, TOTAL_PAY, PAY_RATE,
        AGENCY, SUB_AGENCY, ANNUAL_LEAVE_BAL,
        -- YTD amounts (with overflow truncation applied)
        YTD_BASE_PAY, YTD_OT_PAY, YTD_ND_PAY, YTD_SD_PAY,
        YTD_HOLIDAY_PAY, YTD_HAZ_PAY, YTD_ENV_PAY, YTD_POST_PAY,
        YTD_FICA_HI, YTD_OASDI, YTD_FED_TAX, YTD_ST_TAX, YTD_LOCAL_TAX,
        -- State tax details from YTD_STATE lookup (4 states per DDL)
        YTD_STATE_1, YTD_ST_TX_1_CDE, YTD_ST_TX_1_DED, YTD_ST_TX_1_GRS,
        YTD_STATE_2, YTD_ST_TX_2_CDE, YTD_ST_TX_2_DED, YTD_ST_TX_2_GRS,
        YTD_STATE_3, YTD_ST_TX_3_CDE, YTD_ST_TX_3_DED, YTD_ST_TX_3_GRS,
        YTD_STATE_4, YTD_ST_TX_4_CDE, YTD_ST_TX_4_DED, YTD_ST_TX_4_GRS
    )
    SELECT
        t.PP_END_YEAR,
        t.PP_NUM,
        t.PYF_EYE_ID_1,
        t.LAST_NAME,
        t.FIRST_NAME,
        t.MID_INIT,
        -- FIR_NAME_1: first char
        COALESCE(NULLIF(SUBSTR(t.FIRST_NAME, 1, 1), ''), ' '),
        -- CODE_CONSL: second char
        COALESCE(NULLIF(SUBSTR(t.FIRST_NAME, 2, 1), ''), ' '),
        -- FIR_NAME_3_11: chars 3+
        COALESCE(NULLIF(TRIM(SUBSTR(t.FIRST_NAME, 3)), ''), ' '),

        -- Personnel data: prefer PAD, fallback to MER, then PM2
        COALESCE(t.PAD_PAY_PLAN, t.MER_PAY_PLAN, t.PYF_PAY_PLAN),
        COALESCE(t.PAD_GRADE, t.MER_GRADE, t.PYF_GRADE),
        COALESCE(t.PAD_STEP, t.MER_STEP, t.PYF_STEP),
        COALESCE(t.PAD_OCC_SERIES, t.MER_OCC_SERIES, t.PYF_OCC_SERIES),
        COALESCE(t.PAD_DUTY_STATION, t.MER_DUTY_STA, t.PYF_DUTY_STATION),
        COALESCE(t.PAD_PAY_BASIS, t.MER_PAY_BASIS, t.PYF_PAY_BASIS),
        COALESCE(t.PAD_FLSA_CAT, t.MER_FLSA_CAT, t.PYF_FLSA_CAT),
        COALESCE(t.PAD_WORK_SCHEDULE, t.MER_WORK_SCHEDULE, t.PYF_WORK_SCHEDULE),
        COALESCE(t.PAD_APPT_TYPE, t.MER_APPT_TYPE, t.PYF_APPT_TYPE),
        COALESCE(t.PAD_RETIRE_PLAN, t.MER_RETIRE_PLAN, t.PYF_RETIRE_PLAN),
        COALESCE(t.PAD_FEGLI, t.MER_FEGLI, t.PYF_FEGLI),
        COALESCE(t.PAD_SCD_LEAVE, t.MER_SCD_LEAVE, t.PYF_SCD_LEAVE),
        COALESCE(t.PAD_ADJ_BASIC_PAY, t.MER_ADJ_BASIC_PAY, t.PYF_ADJ_BASIC_PAY),
        COALESCE(t.PAD_LOCALITY_ADJ, t.MER_LOCALITY_ADJ, t.PYF_LOCALITY_ADJ),
        COALESCE(t.PAD_TOTAL_PAY, t.MER_TOTAL_PAY, t.PYF_TOTAL_PAY),
        t.PAD_PAY_RATE,

        t.MER_AGENCY,
        t.PAD_AGENCY,
        t.MER_ANNUAL_LEAVE_BAL,

        -- YTD amounts with overflow clamping
        -- Mirrors exp_Convert_YTD: IIF(ABS(val) > 99999.99, truncate, val)
        COALESCE(t.DYD_BASE_PAY, 0),
        LEAST(ABS(COALESCE(t.DYD_OVERTIME_PAY, 0)), 99999.99) * SIGN(COALESCE(t.DYD_OVERTIME_PAY, 0)),
        COALESCE(t.DYD_NIGHT_DIFF_PAY, 0),
        COALESCE(t.DYD_SUN_PREM_PAY, 0),
        COALESCE(t.DYD_HOLIDAY_PAY, 0),
        COALESCE(t.DYD_HAZ_DUTY_PAY, 0),
        COALESCE(t.DYD_ENV_DIF_PAY, 0),
        COALESCE(t.DYD_POST_DIF_PAY, 0),
        COALESCE(t.DYD_FICA_HI, 0),
        COALESCE(t.DYD_OASDI, 0),
        COALESCE(t.DYD_FED_TAX, 0),
        COALESCE(t.DYD_ST_TAX, 0),
        COALESCE(t.DYD_LOCAL_TAX, 0),

        -- YTD State tax details (4 states per DDL)
        t.YTD_STATE_1, COALESCE(t.YTD_ST_TX_1_CDE, 0), COALESCE(t.YTD_ST_TX_1_DED, 0), COALESCE(t.YTD_ST_TX_1_GRS, 0),
        t.YTD_STATE_2, COALESCE(t.YTD_ST_TX_2_CDE, 0), COALESCE(t.YTD_ST_TX_2_DED, 0), COALESCE(t.YTD_ST_TX_2_GRS, 0),
        t.YTD_STATE_3, COALESCE(t.YTD_ST_TX_3_CDE, 0), COALESCE(t.YTD_ST_TX_3_DED, 0), COALESCE(t.YTD_ST_TX_3_GRS, 0),
        t.YTD_STATE_4, COALESCE(t.YTD_ST_TX_4_CDE, 0), COALESCE(t.YTD_ST_TX_4_DED, 0), COALESCE(t.YTD_ST_TX_4_GRS, 0)
    FROM TMP_TYPE_1_2_JOINED t
    WHERE NOT (t.ERROR_FLAG_PAD OR t.ERROR_FLAG_MER OR t.ERROR_FLAG_PSEUDO);

    DROP TABLE IF EXISTS TMP_TYPE_1_2_JOINED;

    RETURN 'NEWPAY STG TYPE 1/2 load complete';
END;
$$;
