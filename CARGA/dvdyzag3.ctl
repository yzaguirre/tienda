OPTIONS (SKIP=1)
LOAD DATA
INFILE 'ARCHIVO3.txt'
INTO TABLE tabla3
(
	-- TABLA
	-- equipos
	equipo VARCHAR(25), -- nombre en equipos
	-- TABLA
	-- espacios
	espacio VARCHAR(65), -- descripcion en espacios
	capacidadespacio NUMBER, -- capacidad en espacios
	rangoespacio VARCHAR(18), -- rango en espacios
	-- TABLA
	-- tarjetas_red
	tarjetared VARCHAR(60), -- nombre en tarjetas_red
	tarjetaintegrada NUMBER(1), -- integrado en tarjetas_red
	fabricantetared VARCHAR(40), -- fabricante en tarjetas_red
	webfabricante VARCHAR(50), -- web en tarjetas_red
	-- TABLA 
	-- asignaciones_equipos_tarjetas
	ipasignada VARCHAR(18), -- ip en asignaciones_equipos_tarjetas
	mac VARCHAR(18),
	dhcp NUMBER(1)
)