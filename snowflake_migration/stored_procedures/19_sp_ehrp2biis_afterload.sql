-- =============================================================================
-- SP_EHRP2BIIS_AFTERLOAD
-- Converts: ehrp2biis_afterload.sql (Oracle SQL*Plus post-load script)
--
-- Original Oracle operations converted:
--   Step 04: UPDATE nwk_action_secondary_tbl.retnd1_step_cd = NULL (cleanup)
--   Step 05: Execute update_sequence_number_tbl_p
--            Execute 4 formatting procedures
--            Execute cancelled transaction update
--            Update PROCESS_TABLE with next start date
--            Execute WIP status check
--            INSERT into ALL tables from NWK tables (promote staging to prod)
--            DELETE/RE-INSERT cancelled actions
--            Execute run count gathering
--            Truncate staging table
--
-- Oracle → Snowflake conversions:
--   TRUNC(SYSDATE)          -> CURRENT_DATE()
--   ROWNUM < 2              -> LIMIT 1 (or ROW_NUMBER())
--   to_char(sysdate, fmt)   -> TO_CHAR(CURRENT_TIMESTAMP(), fmt)
--   EXEC procedure          -> CALL procedure()
--   SPOOL                   -> Removed (use Snowflake query history)
--   DUAL                    -> Removed (Snowflake doesn't need FROM DUAL)
--   && substitution vars    -> Procedure parameters
--   COMMIT                  -> Auto-commit (Snowflake default) or explicit
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_EHRP2BIIS_AFTERLOAD()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_start_ts  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_log       VARCHAR DEFAULT '';
    v_datetime  VARCHAR;
BEGIN
    v_datetime := TO_CHAR(CURRENT_TIMESTAMP(), 'YYYY-MM-DD_HH24-MI-SS');
    v_log := 'Afterload started at ' || v_datetime || '. ';

    -- =========================================================================
    -- Step 04: Clean up retained step codes
    -- Original: UPDATE nwk_action_secondary_tbl SET retnd1_step_cd = NULL
    --           WHERE event_id in today's load AND retnd1_step_cd = '0.0000000000000'
    -- =========================================================================
    UPDATE NWK_ACTION_SECONDARY_TBL a
    SET a.RETND1_STEP_CD = NULL
    WHERE a.EVENT_ID IN (
        SELECT b.EVENT_ID
        FROM NWK_ACTION_PRIMARY_TBL b
        WHERE b.LOAD_DATE = CURRENT_DATE()
          AND b.EVENT_ID < 9000000000
    )
    AND a.RETND1_STEP_CD = '0.0000000000000';

    v_log := v_log || 'Step 04: retnd1_step_cd cleanup done. ';

    -- =========================================================================
    -- Step 05a: Update sequence numbers
    -- Original: alter procedure update_sequence_number_tbl_p compile;
    --           execute update_sequence_number_tbl_p;
    -- =========================================================================
    CALL UPDATE_SEQUENCE_NUMBER_TBL_P();
    v_log := v_log || 'Sequence numbers updated. ';

    -- =========================================================================
    -- Step 05b: Execute 4 formatting procedures for newly loaded records
    -- These format remarks, handle non-900s records, 900s remarks, and 900s-only
    -- =========================================================================
    CALL UPDT_ERP2BIIS_CRE8_REMARKS01_P();
    CALL UPDATE_ERP2BIIS_NO900S01_P();
    CALL ERP2BIIS_CRE8_REMARKS_900S01();
    CALL UPDATE_ERP2BIIS_900SONLY01_P();
    v_log := v_log || '4 formatting procedures executed. ';

    -- =========================================================================
    -- Step 05c: Update original cancelled transactions
    -- =========================================================================
    CALL UPDT_ORIG_CANCELLED_TRANS01_P();
    v_log := v_log || 'Cancelled transactions updated. ';

    -- =========================================================================
    -- Step 05d: Update PROCESS_TABLE with next start date
    -- Original: Complex subquery finding earliest effdt where WIP status changed
    -- Snowflake: Same logic, ROWNUM < 2 -> LIMIT 1
    -- =========================================================================
    UPDATE PROCESS_TABLE SET P_STARTDT = NULL;

    UPDATE PROCESS_TABLE
    SET P_STARTDT = (
        SELECT EFFDT FROM (
            SELECT a.BIIS_EVENT_ID, a.EMPLID, a.EMPL_RCD,
                   a.EFFDT, a.EFFSEQ, b.DEPTID,
                   a.GVT_WIP_STATUS AS OLD_STATUS,
                   b.GVT_WIP_STATUS AS NEW_STATUS
            FROM NWK_EHRP_RECS_TRACKING_TBL a
            JOIN PS_GVT_JOB b
                ON a.EMPLID = b.EMPLID
                AND a.EMPL_RCD = b.EMPL_RCD
                AND a.EFFDT = b.EFFDT
                AND a.EFFSEQ = b.EFFSEQ
            WHERE a.GVT_WIP_STATUS != b.GVT_WIP_STATUS
              AND a.CHANGED_WIP_STATUS IS NULL
            ORDER BY EFFDT, BIIS_EVENT_ID
        )
        LIMIT 1
    );

    -- Set future date if no changed WIP status found
    UPDATE PROCESS_TABLE
    SET P_STARTDT = DATEADD('day', 10000, CURRENT_DATE())
    WHERE P_STARTDT IS NULL;

    v_log := v_log || 'PROCESS_TABLE updated. ';

    -- =========================================================================
    -- Step 05e: Check WIP status
    -- =========================================================================
    CALL CHK_EHRP2BIIS_WIP_STATUS_P();
    v_log := v_log || 'WIP status checked. ';

    -- =========================================================================
    -- Step 05f: Promote staging to production (NWK -> ALL tables)
    -- Original: INSERT INTO action_primary_all SELECT * FROM nwk_action_primary_tbl
    --           WHERE load_date = TRUNC(SYSDATE)
    -- =========================================================================
    INSERT INTO ACTION_PRIMARY_ALL
    SELECT * FROM NWK_ACTION_PRIMARY_TBL
    WHERE LOAD_DATE = CURRENT_DATE();

    INSERT INTO ACTION_SECONDARY_ALL
    SELECT * FROM NWK_ACTION_SECONDARY_TBL
    WHERE EVENT_ID IN (
        SELECT EVENT_ID FROM NWK_ACTION_PRIMARY_TBL
        WHERE LOAD_DATE = CURRENT_DATE()
    );

    INSERT INTO ACTION_REMARKS_ALL
    SELECT * FROM NWK_ACTION_REMARKS_TBL
    WHERE EVENT_ID IN (
        SELECT EVENT_ID FROM NWK_ACTION_PRIMARY_TBL
        WHERE LOAD_DATE = CURRENT_DATE()
    );

    v_log := v_log || 'Staging promoted to production. ';

    -- =========================================================================
    -- Step 05g: Gather run counts
    -- =========================================================================
    CALL GATHER_EHRP2BIIS_RUNCOUNTS_P(NULL);
    v_log := v_log || 'Run counts gathered. ';

    -- =========================================================================
    -- Step 05h: Handle cancelled actions
    -- Delete then re-insert from NWK tables where WIP status changed today
    -- =========================================================================
    DELETE FROM ACTION_SECONDARY_ALL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM NWK_EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    DELETE FROM ACTION_REMARKS_ALL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM NWK_EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    DELETE FROM ACTION_PRIMARY_ALL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM NWK_EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    INSERT INTO ACTION_PRIMARY_ALL
    SELECT * FROM NWK_ACTION_PRIMARY_TBL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM NWK_EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    INSERT INTO ACTION_SECONDARY_ALL
    SELECT * FROM NWK_ACTION_SECONDARY_TBL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM NWK_EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    INSERT INTO ACTION_REMARKS_ALL
    SELECT * FROM NWK_ACTION_REMARKS_TBL
    WHERE EVENT_ID IN (
        SELECT BIIS_EVENT_ID FROM NWK_EHRP_RECS_TRACKING_TBL
        WHERE BIIS_WIP_STATUS_CHANGED_DT = CURRENT_DATE()
    );

    v_log := v_log || 'Cancelled actions re-processed. ';

    -- =========================================================================
    -- Step 05i: Truncate staging for next load
    -- =========================================================================
    TRUNCATE TABLE NWK_NEW_EHRP_ACTIONS_TBL;

    v_log := v_log || 'Staging truncated. Afterload completed at ' ||
             TO_CHAR(CURRENT_TIMESTAMP()) || '. Duration: ' ||
             DATEDIFF('second', v_start_ts, CURRENT_TIMESTAMP()) || 's.';

    RETURN v_log;

EXCEPTION
    WHEN OTHER THEN
        RETURN 'EHRP2BIIS Afterload FAILED: ' || SQLERRM;
END;
$$;
