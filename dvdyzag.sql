conn / as sysdba

ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS 3;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LOCK_TIME 1;

CREATE ROLE ECYS_ROLE_ADMIN NOT IDENTIFIED;

GRANT CREATE SESSION, CREATE SEQUENCE, CREATE TABLE, CREATE USER, ALTER USER, CREATE PUBLIC SYNONYM, DROP PUBLIC SYNONYM,
EXECUTE ANY PROCEDURE, CREATE PROCEDURE TO ECYS_ROLE_ADMIN;

create tablespace ECYS_TBSP
datafile 'C:\\Users\\David\\ecys_tbsp.dbf'
size 1000m
extent management local
uniform size 512k
segment space management auto;

CREATE USER dvdyzag IDENTIFIED BY f00bar DEFAULT TABLESPACE ECYS_TBSP;
ALTER USER dvdyzag QUOTA UNLIMITED ON ECYS_TBSP;

GRANT ECYS_ROLE_ADMIN TO dvdyzag;

CONN dvdyzag/f00bar