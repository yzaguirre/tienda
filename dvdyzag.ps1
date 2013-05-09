CLS
# crear tablas temporales
Get-Content temps.sql | sqlplus dvdyzag/f00bar > $null
cd CARGA
sqlldr userid=dvdyzag/f00bar control=dvdyzag2.ctl discard=dvdyzag2.dsc bad=dvdyzag2.bad
#sqlldr userid=dvdyzag/f00bar control=dvdyzag1.ctl log=dvdyzag1.log bad=dvdyzag1.bad discard=dvdyzag1.dsc
# crear tablas y poblar
Get-Content notablas.sql | sqlplus dvdyzag/f00bar > $null
Get-Content tablas.sql | sqlplus dvdyzag/f00bar > $null
cd ..