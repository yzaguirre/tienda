CONN dvdyzag/f00bar
CREATE SEQUENCE espac_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE espacios(
	idespacio NUMBER,
	descripcion VARCHAR(65),
	capacidad NUMBER,
	rango VARCHAR(18),
	CONSTRAINT espac_pk_idespac PRIMARY KEY (idespacio)
) TABLESPACE ECYS_TBSP;

CREATE TABLE procesadores(
	idprocesador NUMBER,
	nombre VARCHAR(40),
	version VARCHAR(20),
	metodo_actualizacion SMALLINT,
	CONSTRAINT proce_pk_idproce PRIMARY KEY (idprocesador)
) TABLESPACE ECYS_TBSP;
CREATE SEQUENCE provee_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE proveedores(
	idproveedor NUMBER,
	nombre VARCHAR(30),
	telefono VARCHAR(9),
	correo VARCHAR(40),
	contacto VARCHAR(30),
	CONSTRAINT provee_pk_idprovee PRIMARY KEY (idproveedor)
) TABLESPACE ECYS_TBSP;
CREATE SEQUENCE tar_video_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE tarjetas_video(
	idtarjeta NUMBER,
	modelo VARCHAR(60),
	integrada NUMBER(1),
	fabricante VARCHAR(40),
	web VARCHAR(40),
	CONSTRAINT tar_video_pk_idtar PRIMARY KEY (idtarjeta)
) TABLESPACE ECYS_TBSP;

CREATE TABLE modelos_placa(
	idplaca VARCHAR(9),
	fabricante VARCHAR(40),
	version VARCHAR(12),
	CONSTRAINT mod_plac_pk_idplac PRIMARY KEY (idplaca)
) TABLESPACE ECYS_TBSP;
CREATE SEQUENCE mod_disc_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE modelos_disco(
	idmodelo NUMBER,
	modelo VARCHAR(30),
	interfaz VARCHAR(8),
	tamano NUMBER,
	bytes_sector NUMBER,
	sectores_pista NUMBER,
	cabezas NUMBER,
	sectores NUMBER,
	pistas_cilindro NUMBER,
	CONSTRAINT mod_disc_pk_idmod PRIMARY KEY (idmodelo)
) TABLESPACE ECYS_TBSP;
CREATE SEQUENCE tar_red_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE tarjetas_red(
	idtarjeta NUMBER,
	nombre VARCHAR(60),
	integrado NUMBER(1),
	fabricante VARCHAR(40),
	web VARCHAR(50),
	CONSTRAINT tar_red_pk_idtar PRIMARY KEY (idtarjeta)
) TABLESPACE ECYS_TBSP;
CREATE SEQUENCE admin_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE administradores(
	idadministrador NUMBER,
	nombre VARCHAR(20),
	apellidos VARCHAR(40),
	tipo CHAR(1),
	CONSTRAINT admin_pk_idadmin PRIMARY KEY (idadministrador)
) TABLESPACE ECYS_TBSP;
CREATE SEQUENCE asig_admin_pk_seq INCREMENT BY 1 START WITH 1;
CREATE TABLE asignaciones_administradores(
	idadministrador NUMBER,
	idespacio NUMBER,
	CONSTRAINT asig_admin_fk_admin_id FOREIGN KEY(idadministrador) REFERENCES administradores(idadministrador) ON DELETE CASCADE,
	CONSTRAINT asig_admin_fk_espac_id FOREIGN KEY(idespacio) REFERENCES espacios(idespacio) ON DELETE CASCADE
) TABLESPACE ECYS_TBSP;

CREATE TABLE equipos(
	idespacio NUMBER,
	codigo VARCHAR(4),
	nombre VARCHAR(25),
	fecha DATE,
	idproveedor NUMBER,
	idplaca VARCHAR(9),
	fecha_inventario TIMESTAMP,
	procesador NUMBER,
	memoria VARCHAR(4),
	idtarjeta_video NUMBER,
	CONSTRAINT equip_pk_id PRIMARY KEY (idespacio, codigo),
	CONSTRAINT equip_fk_provee_id FOREIGN KEY (idproveedor) REFERENCES proveedores(idproveedor) ON DELETE CASCADE,
	CONSTRAINT equip_fk_mod_plac_id FOREIGN KEY (idplaca) REFERENCES modelos_placa(idplaca) ON DELETE CASCADE,
	CONSTRAINT equip_fk_proc_id FOREIGN KEY (procesador) REFERENCES procesadores(idprocesador) ON DELETE CASCADE,
	CONSTRAINT equip_fk_tar_vid_id FOREIGN KEY (idtarjeta_video) REFERENCES tarjetas_video(idtarjeta) ON DELETE CASCADE
) TABLESPACE ECYS_TBSP;

CREATE TABLE asignaciones_equipos_tarjetas(
	idespacio NUMBER,
	codigo VARCHAR(4),
	idtarjeta NUMBER,
	ip VARCHAR(18),
	mac VARCHAR(18),
	dhcp NUMBER(1),
	CONSTRAINT asig_equip_tar_pk_id PRIMARY KEY (idespacio, codigo, idtarjeta),
	CONSTRAINT asig_equip_tar_fk_equip_id FOREIGN KEY (idespacio, codigo) REFERENCES equipos (idespacio, codigo) ON DELETE CASCADE,
	CONSTRAINT asig_equip_tar_fk_tar_red_id FOREIGN KEY (idtarjeta) REFERENCES tarjetas_red(idtarjeta) ON DELETE CASCADE
) TABLESPACE ECYS_TBSP;
CREATE TABLE asignaciones_equipos_discos(
	idespacio NUMBER,
	codigo VARCHAR(4),
	idmodelo NUMBER,
	fecha_inventario TIMESTAMP,
	fisical_drive NUMBER,
	particiones NUMBER,
	idpnp_device VARCHAR(250),
	estado VARCHAR(10),
	CONSTRAINT asig_equip_disc_pk_id PRIMARY KEY (idespacio, codigo, idtarjeta),
	CONSTRAINT asig_equip_disc_fk_equip_id FOREIGN KEY (idespacio, codigo) REFERENCES equipos (idespacio, codigo) ON DELETE CASCADE,
	CONSTRAINT asig_equip_disc_fk_mod_disc_id FOREIGN KEY (idmodelo) REFERENCES modelos_disco(idmodelo) ON DELETE CASCADE
) TABLESPACE ECYS_TBSP;
