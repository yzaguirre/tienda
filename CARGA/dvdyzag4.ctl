OPTIONS (SKIP=1)
LOAD DATA
INFILE 'ARCHIVO4.txt'
INTO TABLE tabla4
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
	-- modelos_disco
	modelodisco VARCHAR(30), -- modelo en modelos_disco
	interfaz VARCHAR(8),
	tamano NUMBER,
	bytes_sector NUMBER,
	sectores_pista NUMBER,
	cilindros NUMBER,
	sectores NUMBER,
	pistas_cilindro NUMBER,
	cabezas NUMBER,
	
	-- TABLA
	-- asignaciones_equipos_disco
	finventarioasignadiscoequipo TIMESTAMP, -- fecha_inventario en asignaciones_equipos_disco
	fisical_drive NUMBER,
	particiones NUMBER,
	idpnp_device VARCHAR(250),
	estado VARCHAR(10)
)
