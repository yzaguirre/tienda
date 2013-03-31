CREATE TABLE categoria (
	category INTEGER PRIMARY KEY,
	categoryname VARCHAR(50)
);
CREATE TABLE pais (
	country_id INTEGER PRIMARY KEY,
	country VARCHAR(50)
);
CREATE TABLE cliente (
	customerid INTEGER PRIMARY KEY, 
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	address1 VARCHAR(50),
	zip INTEGER,
	phone VARCHAR(25),
	creditcard VARCHAR(50),
	age SMALLINT,
	income INTEGER,
	gender CHAR(1),
	country_id INTEGER NOT NULL REFERENCES pais(country_id)
);
--REPLACE NUMBER WITH NUMERIC
CREATE TABLE producto (
	prod_id INTEGER PRIMARY KEY,
	title VARCHAR(50),
	actor VARCHAR(50),
	price NUMERIC(12,2),
	special SMALLINT,
	quan_in_stock INTEGER,
	sales INTEGER,
	common_prod_id INTEGER REFERENCES producto(prod_id),
	category INTEGER NOT NULL REFERENCES categoria(category)
);
CREATE TABLE vendedor (
	vendedor_id INTEGER PRIMARY KEY,
	vendedor_name VARCHAR(50)
);
CREATE TABLE orden (
	orderid INTEGER NOT NULL,
	orderlineid INTEGER NOT NULL,
	quantity SMALLINT,
	orderdate DATE,
	price NUMERIC(12,2),
	prod_id INTEGER NOT NULL REFERENCES producto(prod_id),
	customerid INTEGER NOT NULL REFERENCES cliente(customerid),
	vendedor_id INTEGER NOT NULL REFERENCES vendedor(vendedor_id),
	PRIMARY KEY (orderid, orderlineid)
);
CREATE TABLE cliente_historial (
	cli_hist_id SERIAL PRIMARY KEY,
	customerid INTEGER NOT NULL REFERENCES cliente(customerid),
	orderid INTEGER NOT NULL,
	orderlineid INTEGER NOT NULL,
	prod_id INTEGER REFERENCES producto(prod_id),
	FOREIGN KEY(orderid, orderlineid) REFERENCES orden(orderid, orderlineid)
);