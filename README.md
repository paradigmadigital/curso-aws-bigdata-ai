# Curso AWS BigData AI
## Paradigma Digital

# Ejercicio 1 - S3
* Entrar en la consola de AWS
* Cambiar a la región **Irlanda** (arriba a la derecha)
* Ir a S3 y crear un bucket de ejemplo en **Irlanda** (el nombre del bucket debe ser único, mejor que contenga el username)
* Ir a EC2 y arrancar una instancia
    * **Step 1. Choose AMI**
        * **AMI:** Amazon Linux AMI 2017.03.0
    * **Step 2. Instance Type**
        * **Type:** t2-micro
    * **Step 3. Configure Instance**
        * **Network:** vpc-1e056977
        * **IAM role:** ec2-role-curso-bigdata-ai
    * ** Step 6. Configure Security Group**
        * **Select an existing security group:** sg-7b6a7102 | curso-bigdata-ai
    * ** Launch**
        * **key pair:** key-curso-bigdata-ai
* Entrar por ssh en la instancia: `$ ssh -i <path a la clave key-curso-bigdata-ai.pem> ec2-user@<DNS de tu instancia>`
* Descargar dataset desde el bucket de la iniciativa a EC2:
    `aws s3 cp --recursive s3://iniciativa-big-data/phones-data/`
    `aws s3 ls`
    `aws s3 ls iniciativa-big-data/phones-data/`
* Subir dataset desde EC2 al bucket personal:
    `aws s3 cp --recursive s3://<nombre del bucket>/`
    
* Chequear los ficheros desde la consola

# Ejercicio 2 - Redshift: launch

# Ejercicio 3 - Redshift: load data

# Ejercicio 4 - Kinesis
Desde la consola de AWS crear un kinesis stream, con 2 shards