SELECT
    projliegenschaft.t_id AS tid,
    projliegenschaft.projliegenschaft_von,
    projliegenschaft.nummerteilgrundstueck,
    projliegenschaft.geometrie,
    projliegenschaft.flaechenmass,
    CAST(projliegenschaft.t_datasetname AS INT) AS gem_bfs,
    0 AS los,
    aimport.importdate AS lieferdatum
FROM
    agi_dm01avso24.liegenschaften_projliegenschaft AS projliegenschaft
    LEFT JOIN agi_dm01avso24.t_ili2db_basket AS basket
        ON projliegenschaft.t_basket = basket.t_id
   LEFT JOIN 
    (
        SELECT
            max(importdate) AS importdate,
            dataset
        FROM
            agi_dm01avso24.t_ili2db_import
        GROUP BY
            dataset 
    ) AS  aimport
        ON basket.dataset = aimport.dataset
;
