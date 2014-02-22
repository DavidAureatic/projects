*********************************************************
INSTALACION
*********************************************************

1º) copiar la carpeta projects en el document root.

2º) cambiar los datos de conexión del fichero 
	application/configs/settting.ini
	
	indicar la contraseña del usuario php de MySQL (u otro usuario válido en la máquina de testeo)

	[database]
		host = 'localhot';
		user = 'el_usuario';
		password = 'la_contraseña';
		db = 'la_base_de_datos';
	
3º) Preparar base de datos:
	Podemos hacerlo de dos formas:
	(método rápido)
	3.a) Restaurar backup que se encuentra en: 
		/scripts/dump/mydb.sql

	3.b) Ejecutar los scripts de la carpeta  /scripts
		en este orden: 
			- database_strucutre.sql         /modelo original
			- update_database.sql 			 /modificaciones
			- data.sql						 /datos parametricos

