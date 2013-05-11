OPTIONS (SKIP=1)
LOAD DATA
INFILE 'ARCHIVO2.dat'
TRUNCATE
INTO TABLE tabla2
(
	descripcion POSITION(01) CHAR(65) "trim(replace(translate(lower(:descripcion), 'αινσϊρ', 'aeioun'),'\"'))",
	capacidad POSITION(82:85) CHAR "trim(replace(replace(:capacidad,'\"'), '\t'))",
	rango POSITION(93:108) CHAR NULLIF rango=BLANKS "trim(replace(:rango, '\t'))",
	nombre POSITION(109) CHAR TERMINATED BY "-" "trim(replace(replace(translate(lower(:nombre), 'αινσϊρ', 'aeioun'),'\"'),'\t'))",
	apellidos POSITION(*) CHAR(40) "trim(replace(replace(translate(lower(:apellidos), 'αινσϊ', 'aeiou'),'\"'), '\t'))",
	tipo POSITION(190:192) CHAR "trim(replace(:tipo,'\t'))"
)