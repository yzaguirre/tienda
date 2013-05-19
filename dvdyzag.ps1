CLS
# crear tablas temporales
Get-Content temps.sql | sqlplus dvdyzag/f00bar
cd CARGA

sqlldr userid=dvdyzag/f00bar control=dvdyzag1.ctl discard=dvdyzag1.dsc bad=dvdyzag1.bad
sqlldr userid=dvdyzag/f00bar control=dvdyzag2.ctl discard=dvdyzag2.dsc bad=dvdyzag2.bad
sqlldr userid=dvdyzag/f00bar control=dvdyzag3.ctl discard=dvdyzag3.dsc bad=dvdyzag3.bad
sqlldr userid=dvdyzag/f00bar control=dvdyzag4.ctl discard=dvdyzag4.dsc bad=dvdyzag4.bad

cd ..

# crear tablas y poblar
Get-Content notablas.sql | sqlplus dvdyzag/f00bar
Get-Content tablas.sql | sqlplus dvdyzag/f00bar

# Get-Content funciones.sql | sqlplus dvdyzag/f00bar # SOLO PRUEBAS
Get-Content redistrib.sql | sqlplus dvdyzag/f00bar

# cd CONSULTAS