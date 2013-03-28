-- Database: tienda

-- DROP DATABASE tienda;

CREATE DATABASE tienda
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Guatemala.1252'
       LC_CTYPE = 'Spanish_Guatemala.1252'
       CONNECTION LIMIT = -1;


-- Table: categoria

-- DROP TABLE categoria;

CREATE TABLE categoria
(
  category integer NOT NULL,
  categoryname character varying(50),
  CONSTRAINT categoria_pkey PRIMARY KEY (category)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE categoria
  OWNER TO postgres;


-- Table: cliente

-- DROP TABLE cliente;

CREATE TABLE cliente
(
  customerid integer NOT NULL,
  firstname character varying(50),
  lastname character varying(50),
  address1 character varying(50),
  zip integer,
  phone character varying(50),
  creditcard character varying(50),
  age smallint,
  income integer,
  gender character varying(1),
  country_id bigint,
  CONSTRAINT cliente_pkey PRIMARY KEY (customerid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cliente
  OWNER TO postgres;


-- Table: cliente_historial

-- DROP TABLE cliente_historial;

CREATE TABLE cliente_historial
(
  cli_hist_id bigint NOT NULL,
  customerid integer,
  orderid integer,
  prod_id integer,
  CONSTRAINT cliente_historial_pkey PRIMARY KEY (cli_hist_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cliente_historial
  OWNER TO postgres;


-- Table: orden

-- DROP TABLE orden;

CREATE TABLE orden
(
  orderid integer NOT NULL,
  orderlineid integer NOT NULL,
  prod_id integer,
  vendor_id integer,
  quantity smallint,
  orderdate date,
  customerid integer,
  price numeric(12,2),
  CONSTRAINT orden_pkey PRIMARY KEY (orderid, orderlineid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE orden
  OWNER TO postgres;


-- Table: pais

-- DROP TABLE pais;

CREATE TABLE pais
(
  country_id bigint NOT NULL,
  country character varying(50),
  CONSTRAINT pais_pkey PRIMARY KEY (country_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE pais
  OWNER TO postgres;


-- Table: producto

-- DROP TABLE producto;

CREATE TABLE producto
(
  prod_id integer NOT NULL,
  title character varying(50),
  actor character varying(50),
  price numeric(12,2),
  special smallint,
  common_prod_id integer,
  quan_in_stock integer,
  sales integer,
  category integer,
  CONSTRAINT producto_pkey PRIMARY KEY (prod_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE producto
  OWNER TO postgres;


-- Table: vendedor

-- DROP TABLE vendedor;

CREATE TABLE vendedor
(
  vendor_id integer NOT NULL,
  vendor_name text,
  CONSTRAINT vendedor_pkey PRIMARY KEY (vendor_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE vendedor
  OWNER TO postgres;
