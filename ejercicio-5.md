# Curso AWS BigData AI

# Ejercicio 5 - Lambda + Rekognition

* Ir a la consola de AWS Lambda y crear una nueva función
    * Seleccion el blueprint: **blank function**
    * En configure triggers hacer click en el cuadrado con línea discontinua para añadir un trigger
        * Seleccionar trigger de S3
        * **Bucket:** Seleccionar el nombre de nuestro bucket personal (cada uno el suyo)
        * **Event type:** Object Created (All)
        * **Prefix:** images/
        * **Suffix:** jpg
        * Marcar el checkbox de **Enable trigger**
        * Click en next
    * Poner un nombre significativo a nuestra función lambda (mejor si incluye nuestro nombre de usuario)
    * **Runtime:** Seleccionar "Python 2.7"
    * En el textbox de código, seleccionar "Edit code inline" y pegar el código disponible en rekognition/lambda.py
    * Echad un vistazo al código e intentad entenderlo, fijarse en como usamos rekognition a través de boto, la libreria de AWS
    * **Handler:** lambda_function.lambda_handler
    * **Role:** Choose an existing role
    * **Existing role:** lambda_basic_execution
    * No configurar ninguna opción avanzada y finalizar la creación de la función lambda
    * Una vez creada la función, ir a la pestaña **Monitoring** de la función para monitorizar la actividad
    * Hacernos una fotografía centrada de la cara con la cámara del portátil, en linux se puede usar la aplicación cheese (en su defecto coger una foto nuestra ya tomada)
    * Abrir la consola web de S3 y meternos en nuestro bucket
    * Crear el directorio **images** y subir dentro la foto que hemos tomado
    * Observar la monitorización de la función lambda, debería haberse invocado una vez y sin errores
    * Observar como se generan en nuestro bucket 2 directorios: **csv** y **json** donde se almacenan los ficheros de resultados del análisis de la imagen:
        * En el json se almacenan en raw los resultados que devuelve en API
        * En el csv hemos extraido algunos de estos datos y los hemos guardado en un formato tabular (separado por comas)
        * Descargar, abrir con un editor y observar en contenido de los ficheros
    * Podemos hacer más pruebas subiendo diferentes fotos y ver que respuestas da rekognition en cada caso