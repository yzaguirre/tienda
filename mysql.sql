-- probar carga 1

-- probar carga 2
select count(*) from tabla2;
select descripcion from tabla2;
select capacidad from tabla2;
select rango from tabla2;
select nombre from tabla2;
select apellidos from tabla2;
select tipo from tabla2;
select count(*) from administradores;
select count(*) from espacios;
select count(*) from asignaciones_administradores;
-- probar carga 3
select count(*) from tabla3;
select equipo from tabla3;
select espacio from tabla3;
select capacidadespacio from tabla3;
select rangoespacio from tabla3;
select tarjetared from tabla3;
select tarjetaintegrada from tabla3;
select fabricantetared from tabla3;
select webfabricante from tabla3;
select ipasignada from tabla3;
select mac from tabla3;
select dhcp from tabla3;
select count(*) from equipos;
select count(*) from espacios;
select count(*) from tarjetas_red;
select count(*) from asignaciones_equipos_tarjetas;
-- probar carga 4
select count(*) from tabla4;
select equipo from tabla4;
select espacio from tabla4;
select capacidadespacio from tabla4;
select rangoespacio from tabla4;
select modelodisco from tabla4;
select interfaz from tabla4;
select tamano from tabla4;
select bytes_sector from tabla4;
select sectores_pista from tabla4;
select cilindros from tabla4;
select sectores from tabla4;
select pistas_cilindro from tabla4;
select cabezas from tabla4;
select finventarioasignadiscoequipo from tabla4;
select fisical_drive from tabla4;
select particiones from tabla4;
select idpnp_device from tabla4;
select estado from tabla4;


select nombre, es.descripcion, es.rango from equipos join espacios es on (equipos.idespacio = es.idespacio);
select count(*) from equipos join espacios es on (equipos.idespacio = es.idespacio);
select count(*) from asignaciones_equipos_tarjetas;
select count(*) from asignaciones_equipos_discos;
select count(idmodelo) from modelos_disco;
select count(distinct idespacio) from equipos;
select count(*) from equipos;
select count(*) from asignaciones_administradores;
select count(*) from administradores;
select count(distinct (idpnp_device)) from asignaciones_equipos_discos;
select count(*) from equipos;
select count(*) from espacios;
select nombre, eq.idespacio, es.descripcion, es.rango from equipos eq join espacios es on (eq.idespacio = es.idespacio) order by eq.nombre;
select eq.idespacio, nombre, es.descripcion, es.rango from equipos eq join espacios es on (eq.idespacio = es.idespacio) where eq.nombre like 'dell%';
select idespacio, descripcion from espacios where descripcion like 'Aula I%';

select * from espacios order by descripcion, rango;
select idespacios id, descripcion d, rango r from espacios order by descripcion, rango;
select distinct lower(descripcion) d from espacios order by d;