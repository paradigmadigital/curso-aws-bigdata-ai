# Curso AWS BigData AI

# Ejercicio 4 - Kinesis

![Flujo](https://raw.githubusercontent.com/paradigmadigital/curso-aws-bigdata-ai/master/kinesis/kinesis.png)

## Kinesis Streams: generar datos desde un productor y volcarlos en Kinesis Streams

* Ir a la consola de AWS Kinesis Streams y crear un nuevo stream
    * **Kinesis stream name:** Elegir un nombre identificativo (mejor si incluye tu username)
    * **Number of shards:** 2 (observar como las capacidad de lectura/escritura es dependiente del número de shards)
* Editar el código disponible en el repositorio en kinesis/producer.sh y reemplazar en la penúltima línea *"\<tu stream name\>"* por el nombre de tu stream de kinesis
* Llevar el código a nuestra instancia de EC2 (podemos copiar y pegar el contenido con un editor como *nano* o *vim*, o copiar el fichero con scp)
* Dar permisos de ejecución al script en la instancia de EC2 con: `$ chmod +x producer.sh`
* Ejecutar el productor de datos fake con: `$ ./producer.sh`
* Confirmar que no se produce ningún error y camos viendo el json de respuesta de kinesis por pantalla
* A continuación podemos ir a la pestaña de monitorización de kinesis streams y ver como evolucionan las métricas

## Kinesis Firehose: crear un delivery stream que vuelque datos en S3
* Ir a la consola de AWS Kinesis Firehose y crear un nuevo delivery stream
    * **Destination:** S3
    * **Name:** Elegir un nombre identificativo (mejor si incluye tu username)
    * **Bucket:** Elegir el bucket que creamos en el ejercicio 1
    * **Prefix:** Añadir un prefijo significativo (por ejemplo *ingestion-kinesis/*)
    * **Data transformation:** Disable (en este ejercicio no vamos a hacer ninguna transformación, pero podriamos hacer una al vuelo a través de una función lambda)
    * **Logs:** Disable
    * **Role:** firehose_delivery_role (pedirá autorización)

## Kinesis Analytics: conectar Streams con Firehose a través de Analytics
* Ir a la consola de AWS Kinesis Analytics y crear una nueva aplicación
    * **Application name:** nombre significativo (mejor si incluye username)
    * **Source:** Selección el kinesis **stream** que hemos creado en el primer paso
        * Kinesis automaticamente escanea una muestra de los datos y propone un esquema, en la parte inferior de la pantalla podemos verlo y modificar el esquema si quisieramos
        * Grabar y continuar
    * Ir al editor SQL para definir analíticas en tiempo real
        * Iniciar la aplicación y esperar unos segundos a que reciba datos
        * Copiar y pegar el SQL disponible kinesis/analytics.sql para realizar un filtro y una proyección en real time
        * **Save and run SQL**
    * **Connect to a destination**
        * Seleccionar el delivery stream de firehose que hemos creado en el segundo paso
        * Elegir el formato de salida deseado (CSV o JSON)
        * Ver algunas métricas en cloudwatch
        * Pasados unos minutos ver como se van generando los ficheros en nuestro bucket de S3
    
    
