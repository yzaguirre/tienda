# borrar tablas
Get-Content notablas.sql | sqlplus dvdyzag/f00bar > $null
# crear tablas
Get-Content tablas.sql | sqlplus dvdyzag/f00bar > $null
#sqlldr userid=dvdyzag/f00bar control=dvdyzag1.ctl
#sqlldr userid=dvdyzag/f00bar control=dvdyzag2.ctl
#sqlldr userid=dvdyzag/f00bar control=dvdyzag3.ctl
#sqlldr userid=dvdyzag/f00bar control=dvdyzag4.ctl
#sqlldr userid=dvdyzag/f00bar control=dvdyzag1.ctl log=dvdyzag1.log bad=dvdyzag1.bad discard=dvdyzag1.dsc
#