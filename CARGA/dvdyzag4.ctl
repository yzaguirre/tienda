OPTIONS (SKIP=1)
LOAD DATA
CHARACTERSET UTF8
INFILE 'ARCHIVO4.dat'
TRUNCATE
INTO TABLE tabla4
(
	-- TABLA
	-- equipos
	equipo CHAR TERMINATED BY '|' "translate(lower(:equipo), 'αινσϊρ', 'aeioun')", -- nombre en equipos
	-- TABLA
	-- espacios
	espacio POSITION(*+1) CHAR TERMINATED BY '|' "translate(lower(:espacio), 'αινσϊρ', 'aeioun')", -- descripcion en espacios
	capacidadespacio POSITION(*+1) CHAR TERMINATED BY '|' ":capacidadespacio", -- capacidad en espacios
	rangoespacio POSITION(*+1) CHAR TERMINATED BY '|' ":rangoespacio", -- rango en espacios
	-- TABLA
	-- modelos_disco
	modelodisco POSITION(*+1) CHAR TERMINATED BY '|' ":modelodisco", -- modelo en modelos_disco
	interfaz POSITION(*+1) CHAR TERMINATED BY '|' ":interfaz",
	tamano POSITION(*+1) CHAR TERMINATED BY '|' ":tamano",
	bytes_sector POSITION(*+1) CHAR TERMINATED BY '|' ":bytes_sector",
	sectores_pista POSITION(*+1) CHAR TERMINATED BY '|' ":sectores_pista",
	cilindros POSITION(*+1) CHAR  TERMINATED BY '|' ":cilindros",
	sectores POSITION(*+1) CHAR TERMINATED BY '|' ":sectores",
	pistas_cilindro POSITION(*+1) CHAR TERMINATED BY '|' ":pistas_cilindro",
	cabezas POSITION(*+1) CHAR TERMINATED BY '|' ":cabezas",
	
	-- TABLA
	-- asignaciones_equipos_disco
	finventarioasignadiscoequipo POSITION(*+1) CHAR TERMINATED BY '|' "TO_TIMESTAMP(:finventarioasignadiscoequipo, 'DD/MM/YYYY HH24:MI')", -- fecha_inventario en asignaciones_equipos_disco
	fisical_drive POSITION(*+1) CHAR TERMINATED BY '|' ":fisical_drive",
	particiones POSITION(*+1) CHAR TERMINATED BY '|' ":particiones",
	idpnp_device POSITION(*+1) CHAR TERMINATED BY '|' ":idpnp_device",
	estado POSITION(*+1) CHAR(2) ":estado"
)
