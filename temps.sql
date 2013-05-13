-- elimina y crea las 4 tablas temporales
DROP TABLE tabla1 PURGE;
DROP TABLE tabla2 PURGE;
DROP TABLE tabla3 PURGE;
DROP TABLE tabla4 PURGE;
CREATE TABLE tabla1(
	-- TABLA
	-- proveedores
	-- idproveedor NUMBER,
	proveedor VARCHAR(30), -- nombre en proveedores
	telefono VARCHAR(9),
	correo VARCHAR(40),
	contacto VARCHAR(30),
	--
	-- TABLA
	-- equipo
	--idespacio NUMBER,
	-- codigo VARCHAR(4),
	nombreequipo VARCHAR(25), -- nombre en equipos
	fechaequipo DATE,
	-- DADO AQUI idproveedor NUMBER,
	-- DADO AQUI idplaca VARCHAR(9),
	fhinventarioequipo TIMESTAMP,-- fecha_inventario en equipos
	-- DADO AQUI tipoprocesador NUMBER, -- nombre en procesadores
	-- NULL memoria VARCHAR(4),
	-- DADO AQUI idtarjeta_video NUMBER,
	--
	-- TABLA
	-- modelos_placa
	--idplaca VARCHAR(9),
	tipoplaca VARCHAR(40),--fabricante en modelos_placa
	versionplaca VARCHAR(12),
	-- TABLA
	-- procesadores
	-- idprocesador NUMBER,
	tipoprocesador VARCHAR(40), -- nombre en procesadores
	version VARCHAR(20),
	-- NULL metodo_actualizacion SMALLINT,
	--
	-- TABLA
	-- tarjetas_video
	-- idtarjeta NUMBER,
	modelotarjetavideo VARCHAR(60),-- modelo en tarjetas_video
	videointegrado NUMBER(1), -- integrada en tarjetas_video
	fabricantetarvideo VARCHAR(40), -- fabricante en tarjetas_video
	webfabricante VARCHAR(40) -- web en tarjetas_video
) TABLESPACE ECYS_TBSP;
CREATE TABLE tabla2(
	-- TABLA
	-- espacios
	-- idespacio NUMBER,
	descripcion VARCHAR(65),
	capacidad NUMBER,
	rango VARCHAR(18),
	-- 
	-- TABLA
	-- administradores
	-- idadministrador NUMBER,
	nombre VARCHAR(20),
	apellidos VARCHAR(40),
	tipo CHAR(1)
) TABLESPACE ECYS_TBSP;
CREATE TABLE tabla3(
	-- TABLA
	-- equipo
	-- dado aqui idespacio NUMBER,
	-- codigo VARCHAR(4),
	equipo VARCHAR(25), -- nombre en equipos
	-- fecha DATE,
	-- idproveedor NUMBER,
	-- idplaca VARCHAR(9),
	-- fecha_inventario TIMESTAMP,
	-- procesador NUMBER,
	-- memoria VARCHAR(4),
	-- idtarjeta_video NUMBER,
	-- TABLA
	-- espacios
	--idespacio NUMBER,
	espacio VARCHAR(65), -- descripcion en espacios
	capacidadespacio NUMBER, -- capacidad en espacios
	rangoespacio VARCHAR(18), -- rango en espacios
	-- TABLA
	-- tarjetas_red
	-- idtarjeta NUMBER,
	tarjetared VARCHAR(60), -- nombre en tarjetas_red
	tarjetaintegrada NUMBER(1), -- integrado en tarjetas_red
	fabricantetared VARCHAR(40), -- fabricante en tarjetas_red
	webfabricante VARCHAR(50), -- web en tarjetas_red
	-- TABLA 
	-- asignaciones_equipos_tarjetas
	-- DADO AQUI idespacio NUMBER,
	-- codigo VARCHAR(4),
	-- dado aqui idtarjeta NUMBER,
	ipasignada VARCHAR(18), -- ip en asignaciones_equipos_tarjetas
	mac VARCHAR(18),
	dhcp NUMBER(1)
) TABLESPACE ECYS_TBSP;
CREATE TABLE tabla4(
	-- TABLA
	-- equipos
	-- dado aqui idespacio NUMBER,
	-- codigo VARCHAR(4),
	equipo VARCHAR(25), -- nombre en equipos
	-- fecha DATE,
	-- idproveedor NUMBER,
	-- idplaca VARCHAR(9),
	-- fecha_inventario TIMESTAMP,
	-- procesador NUMBER,
	-- memoria VARCHAR(4),
	-- idtarjeta_video NUMBER,
	-- TABLA
	-- espacios
	-- idespacio NUMBER,
	espacio VARCHAR(65), -- descripcion en espacios
	capacidadespacio NUMBER, -- capacidad en espacios
	rangoespacio VARCHAR(18), -- rango en espacios
	-- TABLA
	-- modelos_disco
	-- idmodelo NUMBER,
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
	-- dado aqui idespacio NUMBER,
	-- DADO AQUI codigo VARCHAR(4),
	-- DADO AQUI idmodelo NUMBER,
	finventarioasignadiscoequipo TIMESTAMP, -- fecha_inventario en asignaciones_equipos_disco
	fisical_drive NUMBER,
	particiones NUMBER,
	idpnp_device VARCHAR(250),
	estado VARCHAR(10)
) TABLESPACE ECYS_TBSP;
COMMIT;