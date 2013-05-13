select count(*) from equipos;
select nombre, eq.idespacio, es.descripcion, es.rango from equipos eq join espacios es on (eq.idespacio = es.idespacio) order by eq.nombre;
select eq.idespacio, nombre, es.descripcion, es.rango from equipos eq join espacios es on (eq.idespacio = es.idespacio) where eq.nombre like 'dell%';
select idespacio, descripcion from espacios where descripcion like 'Aula I%';

select * from espacios order by descripcion, rango;
select idespacios id, descripcion d, rango r from espacios order by descripcion, rango;
select distinct lower(descripcion) d from espacios order by d;