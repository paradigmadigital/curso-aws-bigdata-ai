# Curso AWS BigData AI

# Ejercicio 1 - S3
* Entrar en la consola de AWS
* Cambiar a la región **Irlanda** (arriba a la derecha)
* Ir a S3 y crear un bucket de ejemplo en **Irlanda** (el nombre del bucket debe ser único, mejor que contenga el username, a partir de ahora nos referiremos a él con <nombre del bucket personal>)
* Ir a EC2 y arrancar una instancia
    * Step 1. Choose AMI
        * **AMI:** Amazon Linux AMI 2017.03.0
    * Step 2. Instance Type
        * **Type:** t2-micro
    * Step 3. Configure Instance
        * **Network:** vpc-580ad53f
        * **IAM role:** ec2-role-curso-bigdata-ai
    * Step 5. Add Tags
        * **Key:** owner
        * **Value:** \<tu username\>
    * Step 6. Configure Security Group
        * **Select an existing security group:** sg-7b6a7102 | curso-bigdata-ai
    * Launch
        * **key pair:** key-curso-bigdata-ai
    * Launch status
        * Anotar el identificador que le asigna a nuestra instancia
* Descargar el .pem con la clave enviada por mail y cambiarle los permisos:
    * `$ chmod 400 key-curso-bigdata-ai.pem`
* Entrar por ssh en la instancia: 
    * `$ ssh -i <path a la clave key-curso-bigdata-ai.pem> ec2-user@<DNS de tu instancia>`
* Descargar dataset desde el bucket de la iniciativa a EC2:
    * `$ aws s3 ls --human-readable s3://iniciativa-big-data/curso/`
    * `$ aws s3 cp --recursive s3://iniciativa-big-data/curso/ .`
* Subir dataset desde EC2 al bucket personal:
    * `$ aws s3 cp --recursive . s3://<nombre del bucket personal>`
    * `$ aws s3 ls --human-readable s3://<nombre del bucket personal>`
* Chequear los ficheros desde la consola web