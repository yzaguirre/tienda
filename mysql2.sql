select nombre, es.idespacio, rango from equipos eq join espacios es on (eq.idespacio = es.idespacio) where nombre like '%64%';
select count(*) from equipos;
select count(*) from espacios;
select count(*) from asignaciones_equipos_discos;
select count(*) from tarjetas_video;
select count(*) from asignaciones_equipos_tarjetas;
-- reconstruccion de ARCHIVO2.dat
select es.descripcion, es.rango, ad.nombre, ad.apellidos
from asignaciones_administradores aa
join espacios es on (aa.idespacio = es.idespacio)
join administradores ad on (aa.idadministrador = ad.idadministrador)
;
select * from espacios;
select count(distinct descripcion) from espacios;
select * from espacios where rango is null;
select count(*) from asignaciones_administradores;
-- reconstruccion de ARCHIVO1.dat
select prv.nombre, eq.nombre, prc.nombre
from equipos eq
join procesadores prc on (eq.procesador = prc.idprocesador)
join proveedores prv on (eq.idproveedor = prv.idproveedor)
join tarjetas_video tv on (eq.idtarjeta_video = tv.idtarjeta)
join modelos_placa mp on (eq.idplaca = mp.idplaca);

-- reconstruccion de ARCHIVO3.dat
select eq.nombre, es.descripcion, es.rango, tr.nombre
from asignaciones_equipos_tarjetas aet
join equipos eq on (aet.codigo = eq.codigo and aet.idespacio = eq.idespacio)
join espacios es on (aet.idespacio = es.idespacio)
join tarjetas_red tr on (aet.idtarjeta = tr.idtarjeta) 

order by eq.nombre, tr.nombre asc;

-- reconstruccion de ARCHIVO4.dat
select eq.nombre, es.descripcion, es.rango, md.modelo
from asignaciones_equipos_discos aed
join equipos eq on (aed.codigo = eq.codigo and aed.idespacio = eq.idespacio)
join espacios es on (aed.idespacio = es.idespacio)
join modelos_disco md on (aed.idmodelo = md.idmodelo);
select codigo from asignaciones_equipos_discos order by codigo;
select codigo, nombre from equipos limit 30;
select codigo from equipos order by codigo;