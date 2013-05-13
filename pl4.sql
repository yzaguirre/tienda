-- llenar tablas: proveedores, equipos, modelos_placa, procesadores, tarjetas_video
CREATE OR REPLACE PROCEDURE p_tabla1 IS
	xidproveedor NUMBER(14);
	xcodigo NUMBER(14);
	xidprocesador NUMBER(14);
	xidtarjeta NUMBER(14);
	xidplaca NUMBER(14);
	CURSOR t1_curso IS SELECT * FROM tabla1;
	found boolean := false;-- para encontrar ids ya existentes
BEGIN
	for t1_val IN t1_curso LOOP
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
		-- buscar id de equipo
		select codigo into xcodigo from equipos where nombre=t1_val.nombreequipo and rownum=1;
		update equipos SET fecha = t1_val.fechaequipo, idproveedor = xidproveedor, idplaca = xidplaca, fecha_inventario = t1_val.fhinventarioequipo, procesador = xidprocesador, idtarjeta_video = xidtarjeta WHERE codigo = xcodigo;
		COMMIT;
	END LOOP;
END;
/
execute p_tabla1();
show errors