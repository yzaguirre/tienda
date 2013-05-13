-- llenar tablas: equipos, espacios, modelos_disco, asignaciones_equipos_disco
CREATE OR REPLACE PROCEDURE p_tabla4 IS
	xcodigo NUMBER(14);
	xidespacio NUMBER(14);
	xidmodelo NUMBER(14);
	CURSOR t4_curso IS SELECT * FROM tabla4;
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
execute p_tabla4();
show errors