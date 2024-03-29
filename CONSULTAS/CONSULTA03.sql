SELECT CONCAT(ad.nombre, ad.apellidos) AS 'ADMINISTRADOR/SALON',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.1.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.1',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.11.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.11',
		ROUND(AVG(CASE WHEN (es.descripcion = 'USOS MULTIPLES' AND es.RANGO = '10.12.0.0') THEN es.CAPACIDAD ELSE 0 END),3) AS 'USOS MULTIPLES 10.12',
		ROUND(AVG(CASE WHEN (es.descripcion = 'USOS MULTIPLES' AND es.RANGO = '10.200.13.0') THEN es.CAPACIDAD ELSE 0 END),3) AS 'USOS MULTIPLES 10.200',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.21.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.21',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.22.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.22',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.23.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.23',
		ROUND(AVG(CASE WHEN (es.descripcion = 'USOS MULTIPLES' AND es.RANGO = '10.24.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'USOS MULTIPLES 10.24',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA MENTOR' AND es.RANGO = '10.32.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA MENTOR',
		ROUND(AVG(CASE WHEN (es.descripcion = 'BIBLIOTECA' AND es.RANGO = '10.200.7.0/31') THEN es.CAPACIDAD ELSE 0 END),3) AS 'BIBLIOTECA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'CONSEJERIA' AND es.RANGO = '10.200.1.0') THEN es.CAPACIDAD ELSE 0 END),3) AS 'CONSEJERIA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO INFORMATICA' AND es.RANGO = '10.200.10.0/28') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. INFORMATICA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO GALEGO' AND es.RANGO = '10.200.9.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. GALEGO',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO FISICA Y QUIMICA, ORGANIZACION' AND es.RANGO = '10.200.8.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. F Y Q, ORG.',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO IDIOMAS' AND es.RANGO = '10.200.15.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. IDIOMAS',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO MATEMATICAS, CIENCIAS, DIBUJO' AND es.RANGO = '10.200.14.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. M, C, D',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO HUMANIDADES' AND es.RANGO = '10.200.12.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. HUMANIDADES',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO FILOSOFIA' AND es.RANGO = '10.200.11.0/31') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. FILOSOFIA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO LENGUA ESPANOLA' AND es.RANGO = '10.200.13.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPT. LENGUA ESPANOLA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'ENTRADA' AND es.RANGO = '10.200.2.0/28') THEN es.CAPACIDAD ELSE 0 END),3) AS 'ENTRADA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'OFICINA' AND es.RANGO = '10.200.3.0/28') THEN es.CAPACIDAD ELSE 0 END),3) AS 'OFICINA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'VICEDIRECCION' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'VICEDIRECCION',
		ROUND(AVG(CASE WHEN (es.descripcion = 'JEFATURA DE ESTUDIOS' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'JEFATURA DE ESTUDIOS',
		ROUND(AVG(CASE WHEN (es.descripcion = 'SECRETARIA' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'SECRETARIA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'FCT' AND es.RANGO = '10.200.5.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'FCT',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DIRECCION' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DIRECCION',
		ROUND(AVG(CASE WHEN (es.descripcion = 'SALON DE ACTOS' AND es.RANGO IS NULL) THEN es.CAPACIDAD ELSE 0 END),3) AS 'SALON DE ACTOS',
		ROUND(AVG(CASE WHEN (es.descripcion = 'SALA DE PROFESORES' AND es.RANGO = '10.200.6.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'SALA DE PROFESORES',
		ROUND(AVG(es.CAPACIDAD),3) AS 'PROMEDIO HORIZONTAL'
		FROM espacios es, administradores ad, asignaciones_administradores asdm, equipos eqp
		WHERE ad.idadministrador = asdm.idadministrador
		AND asdm.idespacio = es.idespacio
		AND es.idespacio != eqp.idespacio
		GROUP BY CONCAT(ad.nombre, ad.apellidos)
		UNION
		SELECT 'PROMEDIO VERTICAL',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.1.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.1',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.11.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.11',
		ROUND(AVG(CASE WHEN (es.descripcion = 'USOS MULTIPLES' AND es.RANGO = '10.12.0.0') THEN es.CAPACIDAD ELSE 0 END),3) AS 'USOS MULTIPLES 10.12',
		ROUND(AVG(CASE WHEN (es.descripcion = 'USOS MULTIPLES' AND es.RANGO = '10.200.13.0') THEN es.CAPACIDAD ELSE 0 END),3) AS 'USOS MULTIPLES 10.200',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.21.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.21',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.22.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.22',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA INFORMATICA' AND es.RANGO = '10.23.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA INFORMATICA 10.23',
		ROUND(AVG(CASE WHEN (es.descripcion = 'USOS MULTIPLES' AND es.RANGO = '10.24.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'USOS MULTIPLES 10.24',
		ROUND(AVG(CASE WHEN (es.descripcion = 'AULA MENTOR' AND es.RANGO = '10.32.0.0/24') THEN es.CAPACIDAD ELSE 0 END),3) AS 'AULA MENTOR',
		ROUND(AVG(CASE WHEN (es.descripcion = 'BIBLIOTECA' AND es.RANGO = '10.200.7.0/31') THEN es.CAPACIDAD ELSE 0 END),3) AS 'BIBLIOTECA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'CONSEJERIA' AND es.RANGO = '10.200.1.0') THEN es.CAPACIDAD ELSE 0 END),3) AS 'CONSEJERIA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO INFORMATICA' AND es.RANGO = '10.200.10.0/28') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. INFORMATICA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO GALEGO' AND es.RANGO = '10.200.9.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. GALEGO',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO FISICA Y QUIMICA, ORGANIZACION' AND es.RANGO = '10.200.8.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. F Y Q, ORG.',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO IDIOMAS' AND es.RANGO = '10.200.15.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. IDIOMAS',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO MATEMATICAS, CIENCIAS, DIBUJO' AND es.RANGO = '10.200.14.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. M, C, D',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO HUMANIDADES' AND es.RANGO = '10.200.12.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. HUMANIDADES',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO FILOSOFIA' AND es.RANGO = '10.200.11.0/31') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPTO. FILOSOFIA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DEPARTAMENTO LENGUA ESPANOLA' AND es.RANGO = '10.200.13.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DEPT. LENGUA ESPANOLA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'ENTRADA' AND es.RANGO = '10.200.2.0/28') THEN es.CAPACIDAD ELSE 0 END),3) AS 'ENTRADA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'OFICINA' AND es.RANGO = '10.200.3.0/28') THEN es.CAPACIDAD ELSE 0 END),3) AS 'OFICINA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'VICEDIRECCION' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'VICEDIRECCION',
		ROUND(AVG(CASE WHEN (es.descripcion = 'JEFATURA DE ESTUDIOS' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'JEFATURA DE ESTUDIOS',
		ROUND(AVG(CASE WHEN (es.descripcion = 'SECRETARIA' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'SECRETARIA',
		ROUND(AVG(CASE WHEN (es.descripcion = 'FCT' AND es.RANGO = '10.200.5.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'FCT',
		ROUND(AVG(CASE WHEN (es.descripcion = 'DIRECCION' AND es.RANGO = '10.200.4.0/29') THEN es.CAPACIDAD ELSE 0 END),3) AS 'DIRECCION',
		ROUND(AVG(CASE WHEN (es.descripcion = 'SALON DE ACTOS' AND es.RANGO IS NULL) THEN es.CAPACIDAD ELSE 0 END),3) AS 'SALON DE ACTOS',
		ROUND(AVG(CASE WHEN (es.descripcion = 'SALA DE PROFESORES' AND es.RANGO = '10.200.6.0/30') THEN es.CAPACIDAD ELSE 0 END),3) AS 'SALA DE PROFESORES',
		ROUND(AVG(es.capacidad),3) AS 'PROMEDIO HORIZONTAL'
		FROM espacios es, administradores ad, asignaciones_administradores asdm, equipos eqp
		WHERE ad.idadministrador = asdm.idadministrador
		AND asdm.idespacio = es.idespacio
		AND es.idespacio != eqp.idespacio;		