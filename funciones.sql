CONN dvdyzag/f00bar
CREATE OR REPLACE FUNCTION formatearTimeStamp(fecha_raw IN VARCHAR)
	RETURN TIMESTAMP
	IS fecha TIMESTAMP;
BEGIN
	--DD/MM/YYYY HH24:MI
	--DD/MMM/YYYY HH24:MI
	--DD/MMMMM/YYYY HH24:MI
	--CASE length(:fhinventarioequipo) WHEN 8 THEN TO_TIMESTAMP(:fhinventarioequipo,'DD/MON/YY','NLS_DATE_LANGUAGE=AMERICAN') ELSE TO_TIMESTAMP(:fhinventarioequipo,'DD/MON/YYYY','NLS_DATE_LANGUAGE=LATIN AMERICAN SPANISH') END
	fecha := TO_TIMESTAMP(fecha_raw, 'DD/MM/YYYY HH24:MI');
	RETURN(fecha);
END;
/
select formatearTimeStamp('24/10/1990 21:01') from dual;
-- SELECT 
-- SUBSTR('Intel Pentium 4 3.00GHz Version: Modelo 3, nivel 4', 1 , instr('Intel Pentium 4 3.00GHz Version: Modelo 3, nivel 4', 'Version:') - 1)
-- FROM DUAL;
-- SELECT 
-- SUBSTR('Intel Pentium 4 3.00GHz Version: Modelo 3, nivel 4', instr('Intel Pentium 4 3.00GHz Version: Modelo 3, nivel 4', ':') + 1)
-- FROM DUAL;
CREATE TABLE t1 (id number);
create table t2 (id number, msg varchar(15));
insert into t1 values (6);
commit;
create or replace procedure p_ex
is
val number(14);
found boolean := false;
begin
	for x in (SELECT id FROM t1 WHERE id = 5 and rownum=1) loop
		-- Do something here;
		found := true;
		val:= x.id;
		insert into t2 values (val, 'no es null');
	end loop;
	IF not found THEN
		-- DO something else
		insert into t2 values(0, 'es null');
	END IF;
	commit;
end;
/
SHOW errors
execute p_ex;
select * from t2;
insert into t1 values (5);
execute p_ex;
select * from t2;
drop table t1 purge;
drop table t2 purge;