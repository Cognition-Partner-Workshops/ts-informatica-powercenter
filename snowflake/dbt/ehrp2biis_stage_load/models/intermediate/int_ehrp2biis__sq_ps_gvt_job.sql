SELECT j.*
FROM {{ ref('stg_ehrp2biis__ps_gvt_job') }} j
INNER JOIN {{ ref('stg_ehrp2biis__nwk_new_ehrp_actions_tbl') }} n
    ON j.EMPLID = n.EMPLID
    AND j.EMPL_RCD = n.EMPL_RCD
    AND j.EFFDT = n.EFFDT
    AND j.EFFSEQ = n.EFFSEQ
