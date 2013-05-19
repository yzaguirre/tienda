SELECT a3.nombre,
COUNT(CASE WHEN a4.nombre LIKE '%AMD ATHLON XP 2600+ 2.10GHZ%' THEN A1.INTERFAZ END) AS AMD_ATHLONXP,
COUNT(CASE WHEN a4.nombre LIKE '%AMD ATHLON 64 3000+ 1.81%' THEN A1.INTERFAZ END) AS AMD_ATHLON64181,
COUNT(CASE WHEN a4.nombre LIKE '%AMD ATHLON 64 3000+ 2.60%' THEN A1.INTERFAZ END) AS AMD_ATHLON64260,
COUNT(CASE WHEN a4.nombre LIKE '%INTEL COR%' THEN A1.INTERFAZ END) AS INTELCORE,
COUNT(CASE WHEN a4.nombre LIKE '%INTEL PENT%' THEN A1.INTERFAZ END) AS INTELPENTIUM,
COUNT(A1.INTERFAZ) AS TOTAL
FROM
(SELECT Idmodelo as idmodelo,interfaz as interfaz from modelos_disco where interfaz = 'IDE') A1,
(SELECT idespacio AS idespacio,codigo AS CODIGO,IDMODELO AS IDMODELO FROM asignaciones_equipos_discos) A2,
(SELECT idproveedor AS idproveedor,nombre AS nombre FROM proveedores) A3,
(SELECT idprocesador AS idprocesador,nombre AS nombre FROM procesadores) A4,
EQUIPOS A5
WHERE
A5.idproveedor = a3.idproveedor AND
a5.procesador = a4.idprocesador AND
A5.idespacio = A2.idespacio AND
a5.codigo = a2.codigo AND
a2.idmodelo = a1.idmodelo
GROUP BY a3.nombre
UNION
SELECT
'Desviacion',ROUND(STDDEV(a1.amd_athlonxp),3),ROUND(STDDEV(a1.amd_athlon64181),3),ROUND(STDDEV(a1.amd_athlon64260),3),ROUND(STDDEV(a1.intelcore),3),ROUND(STDDEV(a1.intelpentium),3),ROUND(STDDEV(a1.total),3)
FROM
(SELECT a3.nombre,
COUNT(CASE WHEN a4.nombre LIKE '%AMD ATHLON XP 2600+ 2.10GHZ%' THEN A1.INTERFAZ END) AS AMD_ATHLONXP,
COUNT(CASE WHEN a4.nombre LIKE '%AMD ATHLON 64 3000+ 1.81%' THEN A1.INTERFAZ END) AS AMD_ATHLON64181,
COUNT(CASE WHEN a4.nombre LIKE '%AMD ATHLON 64 3000+ 2.60%' THEN A1.INTERFAZ END) AS AMD_ATHLON64260,
COUNT(CASE WHEN a4.nombre LIKE '%INTEL COR%' THEN A1.INTERFAZ END) AS INTELCORE,
COUNT(CASE WHEN a4.nombre LIKE '%INTEL PENT%' THEN A1.INTERFAZ END) AS INTELPENTIUM,
COUNT(A1.INTERFAZ) AS TOTAL
FROM
(SELECT IDMODELO AS IDMODELO,INTERFAZ AS INTERFAZ FROM MODELOS_DISCO WHERE INTERFAZ = 'IDE') A1,
(SELECT idespacio AS idespacio,CODIGO AS CODIGO,IDMODELO AS IDMODELO FROM asignaciones_equipos_discos) A2,
(SELECT idproveedor AS idproveedor,nombre AS nombre FROM proveedores) A3,
(SELECT idprocesador AS idprocesador,nombre AS nombre FROM procesadores) A4,
EQUIPOS A5
WHERE
a5.idproveedor = a3.idproveedor AND
a5.procesador = a4.idprocesador AND
a5.idespacio = a2.idespacio AND
a5.codigo = a2.codigo AND
a2.idmodelo = a1.idmodelo
GROUP BY a3.nombre) A1
;
