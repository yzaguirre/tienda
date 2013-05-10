oratienda
======

Proyecto Bases 1 1er Semestre 2013

## Setup oracle
Cambiar directorio
```
cd C:\Users\David\AeroFS\ecys\U Bases 1\Lab\Proyecto Final
```
Ingresar a `sqlplus`:
```sql
sqlplus "/nolog"
```
Correr el script `dvdyzag.sql`
```sql
@dvdyzag.sql
```
Correr el script `tablas.sql`
```sql
@tablas.sql
```
Correr el script `temps.sql`
```sql
@temps.sql
```
Para eliminar tablas
```sql
@notablas.sql
```
Conectar a la base datos así:
```
sqlplus dvdyzag/f00bar
```

## License

```
Copyright (C) 2013 David Yzaguirre Gonzalez

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```