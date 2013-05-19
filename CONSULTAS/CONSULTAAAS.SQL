--CONSULTA 1

select * from equipos;

select extract(year from fecha_inventario) as anio,
count( CASE WHEN extract(month from fecha_inventario) = '01' THEN fecha_inventario END) as enero,
count( CASE WHEN extract(month from fecha_inventario) = '02' THEN fecha_inventario END) as febrero,
count( CASE WHEN extract(month from fecha_inventario) = '03' THEN fecha_inventario END) as marzo,
count( CASE WHEN extract(month from fecha_inventario) = '04' THEN fecha_inventario END) as abril,
count( CASE WHEN extract(month from fecha_inventario) = '05' THEN fecha_inventario END) as mayo,
count( CASE WHEN extract(month from fecha_inventario) = '06' THEN fecha_inventario END) as junio,
count( CASE WHEN extract(month from fecha_inventario) = '07' THEN fecha_inventario END) as julio,
count( CASE WHEN extract(month from fecha_inventario) = '08' THEN fecha_inventario END) as agosto,
count( CASE WHEN extract(month from fecha_inventario) = '09' THEN fecha_inventario END) as septiembre,
count( CASE WHEN extract(month from fecha_inventario) = '10' THEN fecha_inventario END) as octubre,
count( CASE WHEN extract(month from fecha_inventario) = '11' THEN fecha_inventario END) as noviembre,
count( CASE WHEN extract(month from fecha_inventario) = '12' THEN fecha_inventario END) as diciembre,
count(fecha_inventario) as totalequipos
 from equipos group by (extract(year from fecha_inventario));

--CONSULTA 2

select * from asignaciones_equipos_discos;

select distinct(particiones) from asignaciones_equipos_discos;

select to_char(extract(year from fecha_inventario)) as anio,
count(CASE WHEN particiones = 1 THEN particiones END) as particion_1,
count(CASE WHEN particiones = 2 THEN particiones END) as particion_2,
count(CASE WHEN particiones = 4 THEN particiones END) as particion_4,
count(CASE WHEN particiones = 5 THEN particiones END) as particion_5,
count(particiones) as total
from asignaciones_equipos_discos group by extract(year from fecha_inventario) 
union
select 'total', sum(t1.campo1),sum(t1.campo2),sum(t1.campo3), sum(t1.campo4), sum(t1.campo5) from
(select extract(year from fecha_inventario),
count(CASE WHEN particiones = 1 THEN particiones END) as campo1,
count(CASE WHEN particiones = 2 THEN particiones END) as campo2,
count(CASE WHEN particiones = 4 THEN particiones END) as campo3,
count(CASE WHEN particiones = 5 THEN particiones END) as campo4,
count(particiones) as campo5
from asignaciones_equipos_discos group by extract(year from fecha_inventario)) t1
;
--consulta 3

select t1.nombres as nombres,
sum( case when UPPER(t1.descripcion) like '%SECRETARÍA%' then t2.capacidad END) as SECRETARIA,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO GALEGO%' then t2.capacidad END) as GALEGO,
sum( case when UPPER(t1.descripcion) like '%SALÓN DE ACTOS%' then t2.capacidad END) AS ACTOS,
sum( case when UPPER(t1.descripcion) like '%ENTRADA%' then t2.capacidad END) AS ENTRADA,
sum( case when UPPER(t1.descripcion) like '%OFICINA%' then t2.capacidad END) AS OFICINA,
sum( case when UPPER(t1.descripcion) like '%FCT%' then t2.capacidad END) AS FCT,
sum( case when UPPER(t1.descripcion) like '%BIBLIOTECA%' then t2.capacidad END) AS BIBLIO,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO HUMANIDADES%' then t2.capacidad END) AS HUMANIDADES,
sum( case when UPPER(t1.descripcion) like '%SALA DE PROFESORES%' then t2.capacidad END) AS PROFES,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO INFORMÁTICA%' then t2.capacidad END) AS INFORMATICA_DEPTO,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO LENGUA ESPA%' then t2.capacidad END) AS LENGUAS,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO MATEMÁTICAS,%' then t2.capacidad END) AS MATE,
sum( case when UPPER(t1.descripcion) like '%AULA INFORMÁTICA%' then t2.capacidad END) AS INFORMATICA_AULA,
sum( case when UPPER(t1.descripcion) like '%AULA MENTOR%' then t2.capacidad END) AS MENTOR,
sum( case when UPPER(t1.descripcion) like '%DIRECCIÓN%' then t2.capacidad END) AS DIRECCION,
sum( case when UPPER(t1.descripcion) like '%USOS MULTIPLES%' then t2.capacidad END) AS USOS_MULTIPLES,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO IDIOMAS%' then t2.capacidad END) AS IDIOMAS,
sum( case when UPPER(t1.descripcion) like '%CONSEJERÍA%' then t2.capacidad END) AS CONSEJERIA,
sum( case when UPPER(t1.descripcion) like '%TALLER MANTENIMIENTO%' then t2.capacidad END) AS MANTENIMIENTO,
sum( case when UPPER(t1.descripcion) like '%JEFATURA DE ESTUDIOS%' then t2.capacidad END) AS ESTUDIOS,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO FISICA Y QUIMIC%' then t2.capacidad END) AS FISICAYQUIMICA,
sum( case when UPPER(t1.descripcion) like '%VICEDIRECCION%' then t2.capacidad END) AS VICEDIREC,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO FILOSOFÍA%' then t2.capacidad END) AS FILO,
sum(t2.capacidad) AS HORIZONTAL from
(select distinct(t1.nombre || ' ' || t1.apellidos) as nombres, t2.descripcion as descripcion, t1.idadministrador as idadministrador, t2.idespacio as idespacios from administradores t1, espacios t2, asignaciones_administradores t3 where
t1.idadministrador = t3.idadministrador and t2.idespacio = t3.idespacio)t1,
espacios t2
where
t1.idespacios = t2.idespacio group by t1.nombres
UNION
select
'VERTICAL',
sum(SECRETARIA),SUM(GALEGO),SUM(ACTOS),SUM(ENTRADA),SUM(OFICINA),SUM(FCT),SUM(BIBLIO),SUM(HUMANIDADES),SUM(PROFES),SUM(INFORMATICA_DEPTO),SUM(LENGUAS),SUM(MATE),SUM(INFORMATICA_AULA),SUM(MENTOR),SUM(DIRECCION),SUM(USOS_MULTIPLES),SUM(IDIOMAS),SUM(CONSEJERIA),SUM(MANTENIMIENTO),SUM(ESTUDIOS),SUM(FISICAYQUIMICA),SUM(VICEDIREC),SUM(FILO),SUM(total) 
from
(select t1.nombres as nombres,
sum( case when UPPER(t1.descripcion) like '%SECRETARÍA%' then t2.capacidad END) as SECRETARIA,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO GALEGO%' then t2.capacidad END) as GALEGO,
sum( case when UPPER(t1.descripcion) like '%SALÓN DE ACTOS%' then t2.capacidad END) AS ACTOS,
sum( case when UPPER(t1.descripcion) like '%ENTRADA%' then t2.capacidad END) AS ENTRADA,
sum( case when UPPER(t1.descripcion) like '%OFICINA%' then t2.capacidad END) AS OFICINA,
sum( case when UPPER(t1.descripcion) like '%FCT%' then t2.capacidad END) AS FCT,
sum( case when UPPER(t1.descripcion) like '%BIBLIOTECA%' then t2.capacidad END) AS BIBLIO,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO HUMANIDADES%' then t2.capacidad END) AS HUMANIDADES,
sum( case when UPPER(t1.descripcion) like '%SALA DE PROFESORES%' then t2.capacidad END) AS PROFES,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO INFORMÁTICA%' then t2.capacidad END) AS INFORMATICA_DEPTO,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO LENGUA ESPA%' then t2.capacidad END) AS LENGUAS,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO MATEMÁTICAS,%' then t2.capacidad END) AS MATE,
sum( case when UPPER(t1.descripcion) like '%AULA INFORMÁTICA%' then t2.capacidad END) AS INFORMATICA_AULA,
sum( case when UPPER(t1.descripcion) like '%AULA MENTOR%' then t2.capacidad END) AS MENTOR,
sum( case when UPPER(t1.descripcion) like '%DIRECCIÓN%' then t2.capacidad END) AS DIRECCION,
sum( case when UPPER(t1.descripcion) like '%USOS MULTIPLES%' then t2.capacidad END) AS USOS_MULTIPLES,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO IDIOMAS%' then t2.capacidad END) AS IDIOMAS,
sum( case when UPPER(t1.descripcion) like '%CONSEJERÍA%' then t2.capacidad END) AS CONSEJERIA,
sum( case when UPPER(t1.descripcion) like '%TALLER MANTENIMIENTO%' then t2.capacidad END) AS MANTENIMIENTO,
sum( case when UPPER(t1.descripcion) like '%JEFATURA DE ESTUDIOS%' then t2.capacidad END) AS ESTUDIOS,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO FÍSICA Y QUIMIC%' then t2.capacidad END) AS FISICAYQUIMICA,
sum( case when UPPER(t1.descripcion) like '%VICEDIRECCIÓN%' then t2.capacidad END) AS VICEDIREC,
sum( case when UPPER(t1.descripcion) like '%DEPARTAMENTO FILOSOFÍA%' then t2.capacidad END) AS FILO,
sum(t2.capacidad) as total from
(select distinct(t1.nombre || ' ' || t1.apellidos) as nombres, t2.descripcion as descripcion, t1.idadministrador as idadministrador, t2.idespacio as idespacios from administradores t1, espacios t2, asignaciones_administradores t3 where
t1.idadministrador = t3.idadministrador and t2.idespacio = t3.idespacio)t1,
espacios t2
where
t1.idespacios = t2.idespacio group by t1.nombres)t1;


--consulta 4

select t3.nombre, 
count(case when t4.nombre like '%2.10%' then t1.interfaz end) as AMD_ATHLONXP,
count(case when t4.nombre like '%1.81%' then t1.interfaz end) as AMD_ATHLON64181,
count(case when t4.nombre like '%2.60%' then t1.interfaz end) as AMD_ATHLON64260, 
count(case when UPPER(t4.nombre) like '%INTEL COR%' then t1.interfaz end) as INTELCORE,
count(case when UPPER(t4.nombre) like '%INTEL PENT%' then t1.interfaz end) as INTELPENTIUM,
count(t1.interfaz) as total 
from
(select idmodelo as idmodelo,interfaz as interfaz from modelos_disco where interfaz = 'IDE') t1,
(select idespacio as idespacios,codigo as codigo,idmodelo as idmodelo from asignaciones_equipos_discos) t2, 
(select idproveedor as idproveedor,nombre as nombre from proveedores) t3,
(select idprocesador as idprocesador,nombre as nombre from procesadores) t4,
equipos t5 
where
t5.idproveedor = t3.idproveedor and
t5.procesador = t4.idprocesador and
t5.idespacio = t2.idespacios and
t5.codigo = t2.codigo and
t2.idmodelo = t1.idmodelo
group by t3.nombre
UNION
select 
'XDESVIACION',STDDEV(t1.AMD_ATHLONXP),STDDEV(t1.AMD_ATHLON64181),STDDEV(t1.AMD_ATHLON64260),STDDEV(t1.INTELCORE),STDDEV(t1.INTELPENTIUM),STDDEV(t1.total)
from
(select t3.nombre,
count(case when t4.nombre like '%2.10%' then t1.interfaz end) as AMD_ATHLONXP,
count(case when t4.nombre like '%1.81%' then t1.interfaz end) as AMD_ATHLON64181,
count(case when t4.nombre like '%2.60%' then t1.interfaz end) as AMD_ATHLON64260, 
count(case when UPPER(t4.nombre) like '%INTEL COR%' then t1.interfaz end) as INTELCORE,
count(case when UPPER(t4.nombre) like '%INTEL PENT%' then t1.interfaz end) as INTELPENTIUM,
count(t1.interfaz) as total 
from
(select idmodelo as idmodelo,interfaz as interfaz from modelos_disco where interfaz = 'IDE') t1,
(select idespacio as idespacios,codigo as codigo,idmodelo as idmodelo from asignaciones_equipos_discos) t2,
(select idproveedor as idproveedor,nombre as nombre from proveedores) t3,
(select idprocesador as idprocesador,nombre as nombre from procesadores) t4,
equipos t5 
where
t5.idproveedor = t3.idproveedor and
t5.procesador = t4.idprocesador and
t5.idespacio = t2.idespacios and
t5.codigo = t2.codigo and
t2.idmodelo = t1.idmodelo
group by t3.nombre) t1
;

--consulta 5

select to_char(t1.fecha_inventario,'DAY') as dia,
count(case when extract(year from t1.fecha_inventario) = '2008' then t1.fecha_inventario end) as a2008,
count(t1.fecha_inventario) as total
from
(select t1.nombre as nombre, t2.cantidad as cantidad, t2.fecha_inventario as fecha_inventario from
equipos t1,
(select idespacio as idespacio,codigo as codigo,sum(particiones) as cantidad,fecha_inventario as fecha_inventario from asignaciones_equipos_discos group by (idespacio,codigo,fecha_inventario)) t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t1,
(select t1.nombre as nombre, t2.cantidad as cantidad from equipos t1,
(select idespacio as idespacio,codigo as codigo,count(*) as cantidad from asignaciones_equipos_tarjetas group by (idespacio,codigo))t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t2
where
t1.cantidad = 4 and t2.cantidad < 2 and t1.nombre = t2.nombre
group by (to_char(t1.fecha_inventario,'DAY'))
UNION
select
'total',sum(t1.a2008),sum(t1.total)
from
(select to_char(t1.fecha_inventario,'DAY') as dia,
count(case when extract(year from t1.fecha_inventario) = '2008' then t1.fecha_inventario end) as a2008,
count(t1.fecha_inventario) as total
from
(select t1.nombre as nombre, t2.cantidad as cantidad, t2.fecha_inventario as fecha_inventario from
equipos t1,
(select idespacio as idespacio,codigo as codigo,sum(particiones) as cantidad,fecha_inventario as fecha_inventario from asignaciones_equipos_discos group by (idespacio,codigo,fecha_inventario)) t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t1,
(select t1.nombre as nombre, t2.cantidad as cantidad from equipos t1,
(select idespacio as idespacio,codigo as codigo,count(*) as cantidad from asignaciones_equipos_tarjetas group by (idespacio,codigo))t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t2
where
t1.cantidad = 4 and t2.cantidad < 2 and t1.nombre = t2.nombre
group by (to_char(t1.fecha_inventario,'DAY')))t1
;








-- 10

pivot 10

select t1.dia,t1.dos08 as dos08,
( CASE WHEN t1.dos08 IS NULL THEN 0 ELSE t1.dos08 END) as total
from (
select * from
(select to_char(t2.fecha_inventario,'DAY') as dia, extract(year from t2.fecha_inventario) as anio from
(select t1.nombre as nombre, t2.cantidad as cantidad from equipos t1,
(select idespacio as idespacio,codigo as codigo,count(*) as cantidad from asignaciones_equipos_tarjetas group by (idespacio,codigo))t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t1,
(select t1.nombre as nombre, t2.cantidad as cantidad, t2.fecha_inventario as fecha_inventario from
equipos t1,
(select idespacio as idespacio,codigo as codigo,sum(particiones) as cantidad,fecha_inventario as fecha_inventario from asignaciones_equipos_discos group by (idespacio,codigo,fecha_inventario)) t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t2
where
t1.nombre = t2.nombre and t1.cantidad < 2 and t2.cantidad = 4)
PIVOT
(
sum(1)
for anio
in ('2008' as dos08)
)
) t1
UNION
select
'total',sum(t1.dos08),sum(total) 
from
(select t1.dia,t1.dos08 as dos08,t1.dos08 as total
from (
select * from
(select to_char(t2.fecha_inventario,'DAY') as dia, extract(year from t2.fecha_inventario) as anio from
(select t1.nombre as nombre, t2.cantidad as cantidad from equipos t1,
(select idespacio as idespacio,codigo as codigo,count(*) as cantidad from asignaciones_equipos_tarjetas group by (idespacio,codigo))t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t1,
(select t1.nombre as nombre, t2.cantidad as cantidad, t2.fecha_inventario as fecha_inventario from
equipos t1,
(select idespacio as idespacio,codigo as codigo,sum(particiones) as cantidad,fecha_inventario as fecha_inventario from asignaciones_equipos_discos group by (idespacio,codigo,fecha_inventario)) t2
where
t1.idespacio = t2.idespacio and t1.codigo = t2.codigo) t2
where
t1.nombre = t2.nombre and t1.cantidad < 2 and t2.cantidad = 4)
PIVOT
(
sum(1)
for anio
in ('2008' as dos08)
)
) t1) t1;
