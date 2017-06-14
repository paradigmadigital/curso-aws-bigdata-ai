# Curso AWS BigData AI

# Ejercicio 3 - Redshift: load data
* Hacer click dentro de nuestro cluster y obtener los datos de conexión de la pestaña **configuración**
* Usar estos datos para configurar nuestro cliente SQL (SQL workbench, Squirrel, PyCharm, IntelliJ... si es necesario el driver está disponible [aquí](http://docs.aws.amazon.com/redshift/latest/mgmt/configure-jdbc-connection.html#download-jdbc-driver)
)
* Abrir una sesión con nuestro cliente SQL
* Usar el código SQL disponible en redshift/tables.sql:
    * Crear las tablas en redshift
    * Cargar los datos desde S3 con el comando COPY
    * Hacer algunas consultar
    * Visualizar en la consola de AWS las métricas, los planes de ejecución, el histórico de consultas...
