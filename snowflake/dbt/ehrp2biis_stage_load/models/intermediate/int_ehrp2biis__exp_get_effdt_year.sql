WITH keyed AS (
    SELECT
        s.*,
        l.EHRP_SEQ_NUMBER
    FROM {{ ref('int_ehrp2biis__sq_ps_gvt_job') }} s
    LEFT JOIN {{ ref('int_ehrp2biis__lkp_sequence_num_tbl') }} l
        ON l.EHRP_YEAR = YEAR(s.EFFDT)
), ordered AS (
    SELECT
        keyed.*,
        ROW_NUMBER() OVER (
            PARTITION BY YEAR(EFFDT)
            ORDER BY EFFDT, EMPLID, EMPL_RCD, EFFSEQ
        ) AS EVENT_SEQUENCE
    FROM keyed
)
SELECT
    ordered.*,
    EHRP_SEQ_NUMBER + EVENT_SEQUENCE AS O_EVENT_ID
FROM ordered
