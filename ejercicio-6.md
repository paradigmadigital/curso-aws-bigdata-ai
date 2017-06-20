# Curso AWS BigData AI

# Ejercicio 6 - Athena

* Ir a la consola de AWS Athena
* Ir al **Catalog Manager** y definir una nueva tabla en **Add table**:
    * **Database:** Create new database
    * **Name:** Nombre significativo, mejor si incluye nombre de usuario
    * 
    * **Location of Input Data Set:** ruta al directorio de nuestro bucket donde están los csv, por ejemplo *s3://<mi-bucket>/csv/images/* (sustituir el nombre del bucket por el nuestro)
    * **Data format**: CSV
    * **Columns:** Bulk add columns
    ```
  ImageLocation string,
  Timestamp timestamp,
  Gender string,
  Smiling boolean,
  Beard boolean,
  Mustache boolean,
  Sharpness string,
  Brightness string,
  MouthOpen boolean,
  EyesOpen boolean,
  LowAgeRange int,
  HighAgeRange int,
  Eyeglasses boolean,
  Sunglasses boolean 
    ```
    * No definimos data partitions
    * Un vez hayamos creado la tabla podemos experimentar con la consola de queries interactivas escribiendo SQL. Algunas ideas:
        * Hacer una query que devuelva todos los elementos (SELECT * FROM <nombre tabla> LIMIT 10;)
        * Hacer una query que haga un filtro con WHERE
        * Formatear una query
        * Autocompletar en el editor de queries con *Ctrl + Space*
        * Descargar los resultados de la query
        * Guardar una query y buscarla en el listado de queries guardadas (Saved Queries)
        * Consultar el histórico de queries
        * Inspeccionar las propiedades de una tabla
    
