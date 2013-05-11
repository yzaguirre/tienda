OPTIONS (SKIP=1)
LOAD DATA
INFILE 'ARCHIVO1.dat'
TRUNCATE
INTO TABLE tabla1
(
	proveedor POSITION(1:31) CHAR "trim(replace(translate(lower(:proveedor), 'αινσϊ', 'aeiou'),'\t'))",
	telefono POSITION(32:40) CHAR,
	correo POSITION(53:75) CHAR,
	contacto POSITION(79:93) CHAR "translate(lower(:contacto), 'αινσϊ', 'aeiou')",
	-- TABLA
	-- equipo
	nombreequipo POSITION(120:136) CHAR "translate(lower(:nombreequipo), 'αινσϊρ', 'aeioun')",
	fechaequipo POSITION(161) CHAR TERMINATED BY "\t" "CASE length(:fechaequipo) WHEN 8 THEN TO_DATE(:fechaequipo,'DD/MM/YY') ELSE TO_DATE(:fechaequipo,'DD/MM/YYYY') END",
	-- TABLA
	-- modelos_placa
	tipoplaca POSITION(*) CHAR TERMINATED BY '\t' "lower(trim(:tipoplaca))", --fabricante en modelos_placa
	versionplaca POSITION(*) CHAR TERMINATED BY '\t' NULLIF versionplaca=BLANKS "trim(lower(:versionplaca))",
	fhinventarioequipo POSITION(*) CHAR TERMINATED BY '\t' "CASE length(:fhinventarioequipo) WHEN 16 THEN TO_TIMESTAMP(:fhinventarioequipo,'DD/MM/YYYY HH24:MI') ELSE TO_TIMESTAMP(:fhinventarioequipo,'DD/MONTH/YYYY HH24:MI') END",-- TIMESTAMP -- fecha_inventario en equipos
	-- TABLA
	-- procesadores
	tipoprocesador POSITION(*+1) CHAR TERMINATED BY '"' "trim(SUBSTR(:tipoprocesador, 1 , instr(:tipoprocesador, 'Version:') - 1))", -- nombre en procesadores
	version CHAR "trim(SUBSTR(:tipoprocesador, instr(:tipoprocesador, ':') + 1))", -- esta en el campo de arriba
	-- TABLA
	-- tarjetas_video
	modelotarjetavideo POSITION(*) CHAR TERMINATED BY "\t" "trim(:modelotarjetavideo)",-- modelo en tarjetas_video
	videointegrado POSITION(*) CHAR TERMINATED BY "\t" "CASE trim(lower(:videointegrado)) WHEN 'integrada' THEN 1 ELSE 0 END", -- integrada en tarjetas_video
	fabricantetarvideo POSITION(*) CHAR(32) ":fabricantetarvideo", -- fabricante en tarjetas_video
	webfabricante POSITION(*:494) CHAR "trim(replace(:webfabricante,'\t'))" -- web en tarjetas_video
)