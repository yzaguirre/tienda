SELECT a1.ANIO,a1.ENERO,a1.FEBRERO,a1.MARZO,a1.ABRIL,a1.MAYO,a1.JUNIO,a1.JULIO,a1.AGOSTO,a1.SEPTIEMBRE,a1.OCTUBRE,a1.NOVIEMBRE,a1.DICIEMBRE,
a1.ENERO+a1.FEBRERO+a1.MARZO+a1.ABRIL+a1.MAYO+a1.JUNIO+a1.JULIO+a1.AGOSTO+a1.SEPTIEMBRE+a1.OCTUBRE+a1.NOVIEMBRE+a1.DICIEMBRE AS TOTAL
FROM (SELECT EXTRACT(YEAR FROM fecha_inventario) AS ANIO,EXTRACT(MONTH FROM fecha_inventario) AS MES FROM equipos)
PIVOT(COUNT(1) FOR MES IN ('1' AS ENERO,'2' AS FEBRERO,'3' AS MARZO,'4' AS ABRIL,'5' AS MAYO,'6' AS JUNIO,'7' AS JULIO,'8' AS AGOSTO,'9' AS SEPTIEMBRE,'10' AS OCTUBRE,'11' AS NOVIEMBRE,'12' AS DICIEMBRE))a1;