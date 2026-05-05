-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL
-- Source tables: CPM_YTD_DETAIL_STG_TBL, PSEUDOSSN_TBL, CPM_PM1_STG_TBL, CPM_PM2_STG_TBL
-- Target tables: CPM_NEWPAY_STG_TYPE_1_2_TBL, ERROR_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL(
    P_PP_END_YEAR NUMBER DEFAULT NULL,
    P_PP_NUM NUMBER DEFAULT NULL
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_row_count INTEGER DEFAULT 0;
    v_error_count INTEGER DEFAULT 0;
    v_start_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_MAP_PP_END_YEAR NUMBER DEFAULT P_PP_END_YEAR;
    v_MAP_PP_NUM NUMBER DEFAULT P_PP_NUM;
BEGIN

    -- ========================================
    -- Transformation Chain Overview
    -- ========================================
    -- fil_Bad_Records (Filter)
    -- SQ_CPM_YTD_DETAIL_STG_TBL (Source Qualifier)
    -- SQ_CPM_PM1_STG_TBL (Source Qualifier)
    -- exp_Convert_TYPE_1_PAD_MER (Expression)
    -- exp_Final (Expression)
    -- exp_Initial (Expression)
    -- fil_Error_Message (Filter)
    -- exp_Convert_YTD (Expression)
    -- lkp_CPM_MER_DETAIL_STG_TBL (Lookup Procedure)
    -- lkp_CPM_PAD_DETAIL_STG_TBL (Lookup Procedure)
    -- lkp_CPM_NEWPAY_STG_YTD_STATE_TBL (Lookup Procedure)
    -- exp_Determine_Errors (Expression)
    -- nrm_Errors (Normalizer)
    -- exp_Final_Errors (Expression)
    -- jnr_CPM_YTD (Joiner)
    -- exp_Initial_YTD (Expression)
    -- exp_Stage_PAD_MER_Converted_Fields (Expression)
    -- exp_Stg_YTD_Converted_Fields (Expression)

    -- ========================================
    -- Load target: CPM_NEWPAY_STG_TYPE_1_2_TBL
    -- ========================================
    INSERT INTO CPM_NEWPAY_STG_TYPE_1_2_TBL (
        OPDIV, EFT_ROUT_CK_ID, YTD_BASE_PAY, YTD_OT_PAY, YTD_ND_PAY, YTD_SD_PAY, YTD_HOL_PAY, YTD_PD_PAY, POS_SEN_CDE, YTD_COLA_PAY
        -- ... and 244 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        OPDIV,
        EFT_ROUT_CK_ID,
        YTD_BASE_PAY,
        YTD_OT_PAY,
        YTD_ND_PAY,
        YTD_SD_PAY,
        YTD_HOL_PAY,
        YTD_PD_PAY,
        POS_SEN_CDE,
        YTD_COLA_PAY,
        YTD_UNIF_ALLOW,
        YTD_SEV_PAY,
        CAR_SERV_DTE,
        PROB_DTE,
        SPO_TERM_ID,
        -- ... and 239 more expressions
    FROM CPM_PM1_STG_TBL
    JOIN CPM_PM2_STG_TBL
        ON CPM_PM1_STG_TBL.PYF_EYE_ID_1 = CPM_PM2_STG_TBL.PYF_EYE_ID_2
       AND CPM_PM1_STG_TBL.PP_END_YEAR = CPM_PM2_STG_TBL.PP_END_YEAR
       AND CPM_PM1_STG_TBL.PP_NUM = CPM_PM2_STG_TBL.PP_NUM
    LEFT JOIN PSEUDOSSN_TBL
        ON CPM_PM1_STG_TBL.PYF_EYE_ID_1 = PSEUDOSSN_TBL.PSEUDOSSN
    LEFT JOIN CPM_YTD_DETAIL_STG_TBL  /* jnr_CPM_YTD: Detail Outer Join */
        ON CPM_PM1_STG_TBL.PP_END_YEAR = CPM_YTD_DETAIL_STG_TBL.PP_END_YEAR
       AND CPM_PM1_STG_TBL.PP_NUM = CPM_YTD_DETAIL_STG_TBL.PP_NUM
       AND CPM_PM1_STG_TBL.PYF_EYE_ID_1 = CPM_YTD_DETAIL_STG_TBL.DYD_SSN_1
    WHERE CPM_PM1_STG_TBL.PP_END_YEAR = v_MAP_PP_END_YEAR
      AND CPM_PM1_STG_TBL.PP_NUM = v_MAP_PP_NUM
      /* exp_Determine_Errors: good records = all 3 lookups succeeded */
      AND EXISTS (SELECT 1 FROM CPM_PAD_DETAIL_STG_TBL pad
                  WHERE pad.PAD_SOC_SEC_NO = CPM_PM1_STG_TBL.PYF_EYE_ID_1
                    AND pad.PP_END_YEAR = CPM_PM1_STG_TBL.PP_END_YEAR
                    AND pad.PP_NUM = CPM_PM1_STG_TBL.PP_NUM)
      AND EXISTS (SELECT 1 FROM CPM_MER_DETAIL_STG_TBL mer
                  WHERE mer.MER_SSN = CPM_PM1_STG_TBL.PYF_EYE_ID_1
                    AND mer.PP_END_YEAR = CPM_PM1_STG_TBL.PP_END_YEAR
                    AND mer.PP_NUM = CPM_PM1_STG_TBL.PP_NUM)
      AND PSEUDOSSN_TBL.PSEUDOSSN IS NOT NULL
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: ERROR_TBL
    -- exp_Determine_Errors: error when PAD, MER, or PSEUDOSSN lookup fails
    -- nrm_Errors normalizes 3 error messages into rows
    -- ========================================
    INSERT INTO ERROR_TBL (
        PROCESS_NAME, ERROR_MESSAGE, SOURCE_KEY, ERROR_DATE, PP_END_YEAR, PP_NUM
    )
    SELECT
        'SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL' AS PROCESS_NAME,
        err.ERROR_MESSAGE,
        CPM_PM1_STG_TBL.PYF_EYE_ID_1 AS SOURCE_KEY,
        v_start_ts AS ERROR_DATE,
        CPM_PM1_STG_TBL.PP_END_YEAR,
        CPM_PM1_STG_TBL.PP_NUM
    FROM CPM_PM1_STG_TBL
    JOIN CPM_PM2_STG_TBL
        ON CPM_PM1_STG_TBL.PYF_EYE_ID_1 = CPM_PM2_STG_TBL.PYF_EYE_ID_2
       AND CPM_PM1_STG_TBL.PP_END_YEAR = CPM_PM2_STG_TBL.PP_END_YEAR
       AND CPM_PM1_STG_TBL.PP_NUM = CPM_PM2_STG_TBL.PP_NUM
    LEFT JOIN PSEUDOSSN_TBL
        ON CPM_PM1_STG_TBL.PYF_EYE_ID_1 = PSEUDOSSN_TBL.PSEUDOSSN
    CROSS JOIN LATERAL (
        SELECT msg AS ERROR_MESSAGE FROM (
            SELECT CASE WHEN NOT EXISTS (
                SELECT 1 FROM CPM_PAD_DETAIL_STG_TBL pad
                WHERE pad.PAD_SOC_SEC_NO = CPM_PM1_STG_TBL.PYF_EYE_ID_1
                  AND pad.PP_END_YEAR = CPM_PM1_STG_TBL.PP_END_YEAR
                  AND pad.PP_NUM = CPM_PM1_STG_TBL.PP_NUM)
            THEN 'PAD Record not found for SSN: ' || CPM_PM1_STG_TBL.PYF_EYE_ID_1 END AS msg
            UNION ALL
            SELECT CASE WHEN NOT EXISTS (
                SELECT 1 FROM CPM_MER_DETAIL_STG_TBL mer
                WHERE mer.MER_SSN = CPM_PM1_STG_TBL.PYF_EYE_ID_1
                  AND mer.PP_END_YEAR = CPM_PM1_STG_TBL.PP_END_YEAR
                  AND mer.PP_NUM = CPM_PM1_STG_TBL.PP_NUM)
            THEN 'MER Record not found for SSN: ' || CPM_PM1_STG_TBL.PYF_EYE_ID_1 END
            UNION ALL
            SELECT CASE WHEN PSEUDOSSN_TBL.PSEUDOSSN IS NULL
            THEN 'PSEUDO Record not found for SSN: ' || CPM_PM1_STG_TBL.PYF_EYE_ID_1 END
        ) msgs WHERE msg IS NOT NULL
    ) err
    WHERE CPM_PM1_STG_TBL.PP_END_YEAR = v_MAP_PP_END_YEAR
      AND CPM_PM1_STG_TBL.PP_NUM = v_MAP_PP_NUM
      AND (
          NOT EXISTS (SELECT 1 FROM CPM_PAD_DETAIL_STG_TBL pad
                      WHERE pad.PAD_SOC_SEC_NO = CPM_PM1_STG_TBL.PYF_EYE_ID_1
                        AND pad.PP_END_YEAR = CPM_PM1_STG_TBL.PP_END_YEAR
                        AND pad.PP_NUM = CPM_PM1_STG_TBL.PP_NUM)
          OR NOT EXISTS (SELECT 1 FROM CPM_MER_DETAIL_STG_TBL mer
                         WHERE mer.MER_SSN = CPM_PM1_STG_TBL.PYF_EYE_ID_1
                           AND mer.PP_END_YEAR = CPM_PM1_STG_TBL.PP_END_YEAR
                           AND mer.PP_NUM = CPM_PM1_STG_TBL.PP_NUM)
          OR PSEUDOSSN_TBL.PSEUDOSSN IS NULL
      )
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
