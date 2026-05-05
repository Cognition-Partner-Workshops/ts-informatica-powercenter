-- =============================================================================
-- Stored Procedure: SP_EHRP2BIIS_AFTERLOAD
-- Migrated from: ehrp2biis_afterload.sql (Oracle SQL*Plus)
-- Original: Post-load processing including data formatting, sequence updates,
--           WIP status checks, and promotion from staging to production tables
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_EHRP2BIIS_AFTERLOAD()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_start_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_step VARCHAR DEFAULT 'INIT';
    v_row_count INTEGER DEFAULT 0;
BEGIN

    -- ========================================
    -- Step 04: Update NWK_ACTION_SECONDARY retained step codes
    -- Original: UPDATE_NWK_actsec_RETAINED_STEP
    -- ========================================
    v_step := 'UPDATE_RETAINED_STEP';

    UPDATE NWK_ACTION_SECONDARY_TBL a
    SET a.RETND1_STEP_CD = NULL
    WHERE a.EVENT_ID IN (
        SELECT b.EVENT_ID
        FROM NWK_ACTION_PRIMARY_TBL b
        WHERE b.LOAD_DATE = CURRENT_DATE()
          AND b.EVENT_ID < 9000000000
    )
    AND a.RETND1_STEP_CD = '0.0000000000000';

    -- ========================================
    -- Step 05: Update sequence numbers
    -- Original: EHRP2BIIS_UPDATE_AFTLOAD
    -- ========================================
    v_step := 'UPDATE_SEQUENCE_NUMBERS';

    -- Snowflake equivalent of update_sequence_number_tbl_p
    -- Updates sequence tracking table for the next load cycle
    CALL SP_UPDATE_SEQUENCE_NUMBER_TBL();

    -- ========================================
    -- Step 06: Format newly loaded records
    -- Migrated from 4 Oracle stored procedures:
    --   HISTDBA.UPDT_ERP2BIIS_CRE8_REMARKS01_P
    --   HISTDBA.UPDATE_ERP2BIIS_NO900S01_P
    --   HISTDBA.ERP2BIIS_CRE8_REMARKS_900s01
    --   HISTDBA.UPDATE_ERP2BIIS_900SONLY01_P
    -- ========================================
    v_step := 'FORMAT_NEW_RECORDS';

    CALL SP_UPDT_ERP2BIIS_CRE8_REMARKS01();
    CALL SP_UPDATE_ERP2BIIS_NO900S01();
    CALL SP_ERP2BIIS_CRE8_REMARKS_900S01();
    CALL SP_UPDATE_ERP2BIIS_900SONLY01();

    -- ========================================
    -- Step 07: Update original cancelled transactions
    -- Original: HISTDBA.UPDT_ORIG_CANCELLED_TRANS01_P
    -- ========================================
    v_step := 'UPDATE_CANCELLED_TRANS';

    CALL SP_UPDT_ORIG_CANCELLED_TRANS01();

    -- ========================================
    -- Step 08: Update PROCESS_TABLE
    -- Sets P_STARTDT for WIP status change tracking
    -- ========================================
    v_step := 'UPDATE_PROCESS_TABLE';

    UPDATE PROCESS_TABLE
    SET P_STARTDT = NULL;

    -- Find earliest record with changed WIP status (scalar subquery returns NULL if no rows)
    UPDATE PROCESS_TABLE
    SET P_STARTDT = (
        SELECT MIN(a.EFFDT)
        FROM EHRP_RECS_TRACKING_TBL a
        JOIN PS_GVT_JOB b
            ON a.EMPLID = b.EMPLID
           AND a.EMPL_RCD = b.EMPL_RCD
           AND a.EFFDT = b.EFFDT
           AND a.EFFSEQ = b.EFFSEQ
        WHERE a.GVT_WIP_STATUS <> b.GVT_WIP_STATUS
          AND a.CHANGED_WIP_STATUS IS NULL
    );

    -- Default to far-future date if no changes found
    UPDATE PROCESS_TABLE
    SET P_STARTDT = DATEADD(DAY, 10000, CURRENT_DATE())
    WHERE P_STARTDT IS NULL;

    -- ========================================
    -- Step 09: Check EHRP2BIIS WIP status
    -- Original: chk_ehrp2biis_wip_status_p
    -- ========================================
    v_step := 'CHECK_WIP_STATUS';

    CALL SP_CHK_EHRP2BIIS_WIP_STATUS();

    -- ========================================
    -- Step 10: Promote staging data to production (ALL) tables
    -- Insert today's loaded records from NWK staging into production
    -- ========================================
    v_step := 'PROMOTE_TO_PRODUCTION';

    -- Insert into ACTION_PRIMARY_ALL
    INSERT INTO ACTION_PRIMARY_ALL
    SELECT * FROM NWK_ACTION_PRIMARY_TBL
    WHERE LOAD_DATE = CURRENT_DATE();

    v_row_count := v_row_count + SQLROWCOUNT;

    -- Insert into ACTION_SECONDARY_ALL
    INSERT INTO ACTION_SECONDARY_ALL
    SELECT * FROM NWK_ACTION_SECONDARY_TBL
    WHERE EVENT_ID IN (
        SELECT EVENT_ID FROM NWK_ACTION_PRIMARY_TBL
        WHERE LOAD_DATE = CURRENT_DATE()
    );

    v_row_count := v_row_count + SQLROWCOUNT;

    -- Insert into ACTION_REMARKS_ALL
    INSERT INTO ACTION_REMARKS_ALL
    SELECT * FROM NWK_ACTION_REMARKS_TBL
    WHERE EVENT_ID IN (
        SELECT EVENT_ID FROM NWK_ACTION_PRIMARY_TBL
        WHERE LOAD_DATE = CURRENT_DATE()
    );

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Step 11: Gather run counts
    -- Original: HISTDBA.GATHER_EHRP2BIIS_RUNCOUNTS_P
    -- ========================================
    v_step := 'GATHER_RUNCOUNTS';

    CALL SP_GATHER_EHRP2BIIS_RUNCOUNTS(NULL);

    -- ========================================
    -- Step 12: Update cancelled actions in production
    -- Delete then re-insert changed WIP status records
    -- ========================================
    v_step := 'UPDATE_CANCELLED_ACTIONS';

    -- Delete stale secondary records for changed WIP
    DELETE FROM ACTION_SECONDARY_ALL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    -- Delete stale remarks records for changed WIP
    DELETE FROM ACTION_REMARKS_ALL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    -- Delete stale primary records for changed WIP
    DELETE FROM ACTION_PRIMARY_ALL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    -- Re-insert corrected primary records
    INSERT INTO ACTION_PRIMARY_ALL
    SELECT * FROM NWK_ACTION_PRIMARY_TBL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    -- Re-insert corrected secondary records
    INSERT INTO ACTION_SECONDARY_ALL
    SELECT * FROM NWK_ACTION_SECONDARY_TBL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    -- Re-insert corrected remarks records
    INSERT INTO ACTION_REMARKS_ALL
    SELECT * FROM NWK_ACTION_REMARKS_TBL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    -- ========================================
    -- Step 13: Truncate staging for next load
    -- Prevents duplicate loads if run on consecutive days
    -- ========================================
    v_step := 'TRUNCATE_FOR_NEXT_LOAD';

    TRUNCATE TABLE NWK_NEW_EHRP_ACTIONS_TBL;

    v_step := 'COMPLETED';

    RETURN 'SP_EHRP2BIIS_AFTERLOAD completed successfully. Rows promoted: '
        || v_row_count::VARCHAR
        || '. Started: ' || v_start_ts::VARCHAR
        || '. Finished: ' || CURRENT_TIMESTAMP()::VARCHAR;

EXCEPTION
    WHEN OTHER THEN
        RETURN 'SP_EHRP2BIIS_AFTERLOAD FAILED at step ' || v_step
            || '. Error: ' || SQLERRM;
END;
$$;
