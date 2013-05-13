-- llenar tablas: equipos, espacios, tarjetas_red, asignaciones_equipos_tarjetas
CREATE OR REPLACE PROCEDURE p_tabla3 IS
	xcodigo NUMBER(14);
	xidespacio NUMBER(14);
	xidtarjeta NUMBER(14);
	CURSOR t3_cursor IS SELECT * FROM tabla3;
	found boolean := false;-- para encontrar ids ya existentes
BEGIN
	for t3_val IN t3_cursor LOOP
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
		found:=false;
		FOR x in (select codigo from equipos where idespacio=xidespacio and nombre=t3_val.equipo and rownum=1) LOOP
			found:=true;
			xcodigo:= x.codigo;
		END LOOP;
		IF not found THEN
			xcodigo:= equip_pk_seq.NEXTVAL;
			insert into equipos(idespacio, codigo, nombre) VALUES(xidespacio, xcodigo, t3_val.equipo);
		END IF;
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
		COMMIT;
	END LOOP;
END;
/
execute p_tabla3();
show errors