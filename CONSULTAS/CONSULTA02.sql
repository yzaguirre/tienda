SELECT EXTRACT(YEAR FROM eq.fecha_inventario) AS 'AÑO/particiones',
SUM(CASE WHEN aed.particiones = 1 THEN 1 ELSE 0 END) AS '1 PARTICION',
SUM(CASE WHEN aed.particiones = 2 THEN 1 ELSE 0 END) AS '2 PARTICION',
SUM(CASE WHEN aed.particiones = 3 THEN 1 ELSE 0 END) AS '3 PARTICION',
SUM(CASE WHEN aed.particiones = 4 THEN 1 ELSE 0 END) AS '4 PARTICION',
SUM(CASE WHEN aed.particiones > 4 THEN 1 ELSE 0 END) AS '+ PARTICION',
COUNT(eq.nombre) AS TOTAL
FROM equipos eq, asignaciones_equipos_discos aed
WHERE eq.idespacio = aed.idespacio
AND eq.codigo = aed.codigo
GROUP BY EXTRACT(YEAR FROM eq.fecha_inventario)
UNION ALL
SELECT 'TOTAL',
SUM(CASE WHEN aed.particiones = 1 THEN 1 ELSE 0 END) AS '1 PARTICION',
SUM(CASE WHEN aed.particiones = 2 THEN 1 ELSE 0 END) AS '2 PARTICION',
SUM(CASE WHEN aed.particiones = 3 THEN 1 ELSE 0 END) AS '3 PARTICION',
SUM(CASE WHEN aed.particiones = 4 THEN 1 ELSE 0 END) AS '4 PARTICION',
SUM(CASE WHEN aed.particiones > 4 THEN 1 ELSE 0 END) AS '+ PARTICION',
COUNT(eq.nombre) AS TOTAL
FROM equipos eq, asignaciones_equipos_discos aed
WHERE eq.idespacio = aed.idespacio
AND eq.codigo = aed.codigo;