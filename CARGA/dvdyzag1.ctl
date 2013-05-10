OPTIONS (SKIP=1)
LOAD DATA
INFILE 'ARCHIVO1.txt'
INTO TABLE tabla1
(
	proveedor POSITION(1:31) CHAR "trim(replace(translate(lower(:nombre), 'αινσϊ', 'aeiou'),'\"',''))",
	telefono POSITION(32:40) CHAR,
	correo POSITION(53:75) CHAR,
	contacto POSITION(79:93) CHAR "trim(replace(translate(lower(:contacto), 'αινσϊ', 'aeiou'),'\"',''))",
	-- TABLA
	-- equipo
	nombreequipo POSITION(120:136) CHAR,
	fechaequipo POSITION(161) TERMINATED BY WHITESPACE CHAR,
	-- TABLA
	-- modelos_placa
	tipoplaca POSITION(*:192) CHAR, --fabricante en modelos_placa
	versionplaca POSITION(*:210) CHAR,
	fhinventarioequipo POSITION(*) CHAR TERMINATED BY WHITESPACE,-- TIMESTAMP -- fecha_inventario en equipos
	-- TABLA
	-- procesadores
	tipoprocesador POSITION(*) ENCLOSED BY '"' CHAR, -- nombre en procesadores
	version CHAR, -- esta en el campo de arriba
	-- TABLA
	-- tarjetas_video
	modelotarjetavideo POSITION(*+1) TERMINATED BY "\t" CHAR,-- modelo en tarjetas_video
	videointegrado POSITION(*) TERMINATED BY "\t" CHAR, -- integrada en tarjetas_video
	fabricantetarvideo POSITION(*) TERMINATED BY "\t" CHAR, -- fabricante en tarjetas_video
	webfabricante POSITION(*:494) CHAR -- web en tarjetas_video
)