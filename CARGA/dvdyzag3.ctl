OPTIONS (SKIP=1)
LOAD DATA
CHARACTERSET UTF8
INFILE 'ARCHIVO3.dat'
TRUNCATE
INTO TABLE tabla3
(
	-- TABLA
	-- equipos
	equipo CHAR TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' "translate(lower(:equipo), 'αινσϊρ', 'aeioun')", -- nombre en equipos
	-- TABLA
	-- espacios
	espacio CHAR TERMINATED BY '\t' ENCLOSED BY '"' "trim(translate(lower(:espacio), 'αινσϊρ', 'aeioun'))", -- descripcion en espacios
	capacidadespacio CHAR TERMINATED BY '\t' ":capacidadespacio", -- capacidad en espacios
	rangoespacio CHAR TERMINATED BY '\t' ":rangoespacio", -- rango en espacios
	-- TABLA
	-- tarjetas_red
	tarjetared CHAR TERMINATED BY '\t' ENCLOSED BY '"' "lower(:tarjetared)", -- nombre en tarjetas_red
	tarjetaintegrada CHAR TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' "CASE trim(lower(:tarjetaintegrada)) WHEN 'integrada' THEN 1 ELSE 0 END", -- integrado en tarjetas_red
	fabricantetared CHAR TERMINATED BY '\t' ENCLOSED BY '"' "lower(:fabricantetared)", -- fabricante en tarjetas_red
	webfabricante CHAR TERMINATED BY '\t' ":webfabricante", -- web en tarjetas_red
	-- TABLA 
	-- asignaciones_equipos_tarjetas
	ipasignada CHAR TERMINATED BY '\t' ":ipasignada", -- ip en asignaciones_equipos_tarjetas
	mac CHAR TERMINATED BY '\t' ":mac",
	dhcp POSITION(*) CHAR(3) "CASE trim(replace(lower(:dhcp),'\t')) WHEN 'si' THEN 1 ELSE 0 END"
)