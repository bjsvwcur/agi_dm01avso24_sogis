SELECT
    objektname.t_id AS tid,
    objektname.objektname_von,
    objektname.aname AS name,
    CAST(objektname.t_datasetname AS INT) AS gem_bfs,
    0 AS los,
    aimport.importdate AS lieferdatum
FROM
    agi_dm01avso24.bodenbedeckung_objektname AS objektname
    LEFT JOIN agi_dm01avso24.t_ili2db_basket AS basket
        ON objektname.t_basket = basket.t_id
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
