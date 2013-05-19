-- llenar tablas: equipos, espacios, tarjetas_red, asignaciones_equipos_tarjetas
-- llenar tablas: proveedores, equipos, modelos_placa, procesadores, tarjetas_video
CREATE OR REPLACE PROCEDURE p_tabla3y1 IS
	xidproveedor NUMBER(14);
	xidprocesador NUMBER(14);
	xidplaca NUMBER(14);
	xcodigo NUMBER(14);
	xidespacio NUMBER(14);
	xidtarjeta NUMBER(14);
	CURSOR t3_cursor IS SELECT * FROM tabla3 WHERE tarjetared NOT LIKE '%broadcom%'  ORDER BY equipo, tarjetared;
	CURSOR t1_cursor IS SELECT * FROM tabla1 ORDER BY nombreequipo;
	t3_val t3_cursor%ROWTYPE;
	t1_val t1_cursor%ROWTYPE;
	found boolean := false;-- para encontrar ids ya existentes
BEGIN
	OPEN t3_cursor;
	OPEN t1_cursor;
	LOOP
		FETCH t3_cursor INTO t3_val;
		FETCH t1_cursor INTO t1_val;
		EXIT WHEN t3_cursor%NOTFOUND;
		-- primero ocuparse de la tabla 3
		-- buscar id de espacios
		found:=false;
		FOR x in (select idespacio from espacios where descripcion=t3_val.espacio and rango=t3_val.rangoespacio and rownum=1) LOOP
			found:=true;
			xidespacio:= x.idespacio;
		END LOOP;
		IF not found THEN
			xidespacio:= espac_pk_seq.NEXTVAL;
			insert into espacios VALUES(xidespacio, t3_val.espacio, t3_val.capacidadespacio, t3_val.rangoespacio);
		END IF;
		-- buscar id de equipo
		xcodigo:= equip_pk_seq.NEXTVAL;
		insert into equipos(idespacio, codigo, nombre) VALUES(xidespacio, xcodigo, t3_val.equipo);
		-- buscar id de tarjetas_red
		found:=false;
		FOR x in (select idtarjeta from tarjetas_red where nombre=t3_val.tarjetared and rownum=1) LOOP
			found:=true;
			xidtarjeta:= x.idtarjeta;
		END LOOP;
		IF not found THEN
			xidtarjeta:= tar_red_pk_seq.NEXTVAL;
			insert into tarjetas_red VALUES(xidtarjeta, t3_val.tarjetared, t3_val.tarjetaintegrada, t3_val.fabricantetared, t3_val.webfabricante);
		END IF;
		insert into asignaciones_equipos_tarjetas values (xidespacio, xcodigo, xidtarjeta, t3_val.ipasignada, t3_val.mac, t3_val.dhcp);
		-- ahora a ocuparse de la tabla 1
		-- buscar id de proveedores
		found:=false;
		FOR x in (select idproveedor from proveedores where nombre=t1_val.proveedor and rownum=1) LOOP
			found:=true;
			xidproveedor:= x.idproveedor;
		END LOOP;
		IF not found THEN
			xidproveedor:= provee_pk_seq.NEXTVAL;
			insert into proveedores VALUES(xidproveedor, t1_val.proveedor, t1_val.telefono, t1_val.correo, t1_val.contacto);
		END IF;
		-- buscar id de modelos_placa
		found:=false;
		FOR x in (select idplaca from modelos_placa where fabricante=t1_val.tipoplaca and rownum=1) LOOP
			found:=true;
			xidplaca:= x.idplaca;
		END LOOP;
		IF not found THEN
			xidplaca:= mod_plac_pk_seq.NEXTVAL;
			insert into modelos_placa VALUES(xidplaca, t1_val.tipoplaca, t1_val.versionplaca);
		END IF;
		-- buscar id de procesadores
		found:=false;
		FOR x in (select idprocesador from procesadores where nombre=t1_val.tipoprocesador and rownum=1) LOOP
			found:=true;
			xidprocesador:= x.idprocesador;
		END LOOP;
		IF not found THEN
			xidprocesador:= proc_pk_seq.NEXTVAL;
			insert into procesadores(idprocesador, nombre, version) VALUES(xidprocesador, t1_val.tipoprocesador, t1_val.version);
		END IF;
		-- buscar id de tarjetas_video
		found:=false;
		FOR x in (select idtarjeta from tarjetas_video where modelo=t1_val.modelotarjetavideo and rownum=1) LOOP
			found:=true;
			xidtarjeta:= x.idtarjeta;
		END LOOP;
		IF not found THEN
			xidtarjeta:= tar_video_pk_seq.NEXTVAL;
			insert into tarjetas_video VALUES(xidtarjeta, t1_val.modelotarjetavideo, t1_val.videointegrado, t1_val.fabricantetarvideo, t1_val.webfabricante);
		END IF;
		update equipos SET fecha = t1_val.fechaequipo, idproveedor = xidproveedor, idplaca = xidplaca, fecha_inventario = t1_val.fhinventarioequipo, procesador = xidprocesador, idtarjeta_video = xidtarjeta WHERE codigo = xcodigo;
		COMMIT;
	END LOOP;
	CLOSE t3_cursor;
	CLOSE t1_cursor;
	COMMIT;
END;
/
-- complementar tabla asignaciones_equipos_tarjetas de ARCHIVO3.dat
CREATE OR REPLACE PROCEDURE p_tabla3cont IS
	CURSOR t3_cursor IS SELECT * FROM tabla3 WHERE tarjetared LIKE '%broadcom%';
	CURSOR equipos_cursor IS SELECT idespacio, codigo FROM equipos WHERE nombre LIKE '%dell%';
	t3_val t3_cursor%ROWTYPE;
	equipos_val equipos_cursor%ROWTYPE;
	xidtarjeta NUMBER(14);
	found boolean := false;-- para encontrar ids ya existentes
BEGIN
	OPEN t3_cursor;
	OPEN equipos_cursor;
	LOOP
		FETCH t3_cursor INTO t3_val;
		FETCH equipos_cursor INTO equipos_val;	
		EXIT WHEN t3_cursor%NOTFOUND;
		-- buscar id de tarjetas_red
		found:=false;
		FOR x in (select idtarjeta from tarjetas_red where nombre=t3_val.tarjetared and rownum=1) LOOP
			found:=true;
			xidtarjeta:= x.idtarjeta;
			END LOOP;
			IF not found THEN
				xidtarjeta:= tar_red_pk_seq.NEXTVAL;
				insert into tarjetas_red VALUES(xidtarjeta, t3_val.tarjetared, t3_val.tarjetaintegrada, t3_val.fabricantetared, t3_val.webfabricante);
			END IF;
			insert into asignaciones_equipos_tarjetas values (equipos_val.idespacio, equipos_val.codigo, xidtarjeta, t3_val.ipasignada, t3_val.mac, t3_val.dhcp);
	END LOOP;
	CLOSE t3_cursor;
	CLOSE equipos_cursor;
END;
/
show errors
-- llenar tablas: administradores, espacios, asignaciones_administradores
CREATE OR REPLACE PROCEDURE p_tabla2 IS
	xidadministrador NUMBER(14);
	xidespacio NUMBER(14);
	CURSOR t2_cursor IS SELECT * FROM tabla2;
	found boolean := false;-- para encontrar ids ya existentes
BEGIN
	for t2_val IN t2_cursor LOOP
		-- buscar id de administradores
		found:=false;
		FOR x in (SELECT idadministrador from administradores where nombre=t2_val.nombre and apellidos=t2_val.apellidos and rownum=1) loop
			found:=true;
			xidadministrador:= x.idadministrador;
		END LOOP;
		IF not found THEN
			xidadministrador:= admin_pk_seq.NEXTVAL;
			INSERT INTO administradores VALUES(xidadministrador, t2_val.nombre, t2_val.apellidos, t2_val.tipo);
		END IF;
		-- buscar id de espacios
		found:=false;
		FOR x in (select idespacio from espacios where descripcion=t2_val.descripcion and ((rango is null and t2_val.rango is null) or rango=t2_val.rango) and rownum=1) LOOP
			found:=true;
			xidespacio:= x.idespacio;
		END LOOP;
		IF not found THEN
			xidespacio:= espac_pk_seq.NEXTVAL;
			insert into espacios VALUES(xidespacio, t2_val.descripcion, t2_val.capacidad, t2_val.rango);
		END IF;
		
		insert into asignaciones_administradores values(xidadministrador, xidespacio);
		COMMIT;
	END LOOP;
END;
/
-- llenar tablas: equipos, espacios, modelos_disco, asignaciones_equipos_disco
CREATE OR REPLACE PROCEDURE p_tabla4 IS
	xcodigo NUMBER(14);
	xidespacio NUMBER(14);
	xidmodelo NUMBER(14);
	CURSOR t4_curso IS SELECT * FROM tabla4 order by equipo;
	found boolean := false;-- para encontrar ids ya existentes
BEGIN
	for t4_val IN t4_curso LOOP
		-- buscar id de espacios
		found:=false;
		FOR x in (select idespacio from espacios where descripcion=t4_val.espacio and rango=t4_val.rangoespacio and rownum=1) LOOP
			found:=true;
			xidespacio:= x.idespacio;
		END LOOP;
		IF not found THEN
			xidespacio:= espac_pk_seq.NEXTVAL;
			insert into espacios VALUES(xidespacio, t4_val.espacio, t4_val.capacidadespacio, t4_val.rangoespacio);
		END IF;
		-- buscar id de equipo
		found:=false;
		FOR x in (select codigo from equipos where idespacio=xidespacio and nombre=t4_val.equipo and rownum=1) LOOP
			found:=true;
			xcodigo:= x.codigo;
		END LOOP;
		IF not found THEN
			xcodigo:= equip_pk_seq.NEXTVAL;
			insert into equipos(idespacio, codigo, nombre) VALUES(xidespacio, xcodigo, t4_val.equipo);
		END IF;
		-- buscar id de modelos_disco
		found:=false;
		FOR x in (select idmodelo from modelos_disco where modelo=t4_val.modelodisco and rownum=1) LOOP
			found:=true;
			xidmodelo:= x.idmodelo;
		END LOOP;
		IF not found THEN
			xidmodelo:= mod_disc_pk_seq.NEXTVAL;
			insert into modelos_disco VALUES(xidmodelo, t4_val.modelodisco, t4_val.interfaz, t4_val.tamano, t4_val.bytes_sector, t4_val.sectores_pista, t4_val.cilindros, t4_val.cabezas, t4_val.sectores, t4_val.pistas_cilindro);
		END IF;
		insert into asignaciones_equipos_discos values(xidespacio, xcodigo, xidmodelo, t4_val.finventarioasignadiscoequipo, t4_val.fisical_drive, t4_val.particiones, t4_val.idpnp_device, t4_val.estado);
		COMMIT;
	END LOOP;
END;
/
execute p_tabla2();
execute p_tabla3y1();
execute p_tabla3cont();
execute p_tabla4();
show errors