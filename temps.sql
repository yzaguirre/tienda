-- elimina y crea las 4 tablas temporales
CONN dvdyzag/f00bar
DROP TABLE tabla1;
DROP TABLE tabla2;
DROP TABLE tabla3;
DROP TABLE tabla4;
CREATE TABLE tabla1(
	-- TABLA
	-- proveedores
	-- idproveedor NUMBER,
	nombre VARCHAR(30),
	telefono VARCHAR(9),
	correo VARCHAR(40),
	contacto VARCHAR(30),
	
	-- TABLA
	-- equipo
	--idespacio NUMBER,
	-- codigo VARCHAR(4),
	nombre VARCHAR(25),
	fecha DATE,
	-- DADO AQUI idproveedor NUMBER,
	-- DADO AQUI idplaca VARCHAR(9),
	fecha_inventario TIMESTAMP,
	procesador NUMBER,
	memoria VARCHAR(4),
	idtarjeta_video NUMBER,
	
	-- TABLA
	-- modelos_placa
	--idplaca VARCHAR(9),
	fabricante VARCHAR(40),
	version VARCHAR(12),
	
	-- TABLA
	-- procesadores
	-- idprocesador NUMBER,
	nombre VARCHAR(40),
	version VARCHAR(20),
	-- NULL metodo_actualizacion SMALLINT,
	
	-- TABLA
	-- tarjetas_video
	-- idtarjeta NUMBER,
	modelo VARCHAR(60),
	integrada NUMBER(1),
	fabricante VARCHAR(40),
	web VARCHAR(40)
) TABLESPACE ECYS_TBSP;
CREATE TABLE tabla2(
	-- TABLA
	-- espacios
	-- idespacio NUMBER,
	descripcion VARCHAR(65),
	capacidad NUMBER,
	rango VARCHAR(18),
	
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
	nombre VARCHAR(25),
	-- fecha DATE,
	-- idproveedor NUMBER,
	-- idplaca VARCHAR(9),
	-- fecha_inventario TIMESTAMP,
	-- procesador NUMBER,
	-- memoria VARCHAR(4),
	-- idtarjeta_video NUMBER,
	
	-- espacios
	--idespacio NUMBER,
	descripcion VARCHAR(65),
	capacidad NUMBER,
	rango VARCHAR(18),
	
	-- TABLA
	-- tarjetas_red
	-- idtarjeta NUMBER,
	nombre VARCHAR(60),
	integrado NUMBER(1),
	fabricante VARCHAR(40),
	web VARCHAR(50),
	
	-- TABLA 
	-- asignaciones_equipos_tarjetas
	-- DADO AQUI idespacio NUMBER,
	-- codigo VARCHAR(4),
	-- dado aqui idtarjeta NUMBER,
	ip VARCHAR(18),
	mac VARCHAR(18),
	dhcp NUMBER(1)
) TABLESPACE ECYS_TBSP;
CREATE TABLE tabla4(
	-- TABLA
	-- equipo
	-- dado aqui idespacio NUMBER,
	-- codigo VARCHAR(4),
	nombre VARCHAR(25),
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
	descripcion VARCHAR(65),
	capacidad NUMBER,
	rango VARCHAR(18),
	
	-- TABLA
	-- modelos_disco
	-- idmodelo NUMBER,
	modelo VARCHAR(30),
	interfaz VARCHAR(8),
	tamano NUMBER,
	bytes_sector NUMBER,
	sectores_pista NUMBER,
	sectores NUMBER,
	pistas_cilindro NUMBER,
	cabezas NUMBER,
	
	-- TABLA
	-- asignaciones_equipos_disco
	-- dado aqui idespacio NUMBER,
	codigo VARCHAR(4),
	idmodelo NUMBER,
	fecha_inventario TIMESTAMP,
	fisical_drive NUMBER,
	particiones NUMBER,
	idpnp_device VARCHAR(250),
	estado VARCHAR(10)
) TABLESPACE ECYS_TBSP;
