OPTIONS (SKIP=1)
LOAD DATA
INFILE 'CARGA\ARCHIVO1.txt'
INTO TABLE proveedores
()
--
INTO TABLE equipos
()
--
INTO TABLE modelos_placa
()
--
INTO TABLE procesadores
()
--
INTO TABLE tarjetas_video
()

OPTIONS (SKIP=1)
LOAD DATA
INFILE 'CARGA\ARCHIVO1.txt'
INTO TABLE tmp_ejemplo
(
	id_visita   "seq_tmp_ejemplo.NEXTVAL",
	codigo      POSITION(1:10)        "replace(:codigo,'-','')",
	fecha       POSITION(12:21)       ,
	direccion   POSITION(23:53)       "trim(:direccion)",
	fecha_visi  POSITION(55:64)       "TO_DATE(:fecha_visi,'DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN')"
)
--libro
LOAD DATA
INFILE 'bookshelf.dat'
INTO TABLE BOOKSHELF
(
	Title POSITION(01:100) CHAR,
	Publisher POSITION(101:120) CHAR,
	CategoryName POSITION(121:140) CHAR,
	Rating POSITION(141:142) CHAR
)
--auxiliar
CREATE SEQUENCE seq_tmp_ejemplo START WITH 1 INCREMENT BY 1;
CREATE TABLE tmp_ejemplo(
id_visita INT PRIMARY KEY,
codigo INT NOT NULL,
fecha DATE NOT NULL,
direccion VARCHAR(31) NOT NULL,
fecha_visi DATE NOT NULL
);
COMMIT;
exit;