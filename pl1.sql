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
		FOR x in (select idespacio from espacios where descripcion=t2_val.descripcion and rango=t2_val.rango and rownum=1) LOOP
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
execute p_tabla2();
show errors