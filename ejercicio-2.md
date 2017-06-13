README.md# Curso AWS BigData AI

# Ejercicio 2 - Redshift: launch
* Desde la consola web de AWS ir al servicio de redshift
* Click en launch cluster
    * Elegir un identificador (mejor asociado a vuestro nombre de usuario), un nombre de usuario y una contraseña (anotar contraseña)
    * Node type: **dc1.large**
    * Cluster type: **Multi Node**
    * Number of compute nodes: **2**
    * VPC: Default VPC
    * Publicly accessible: **Yes**
    * VPC security groups: **curso-bigdata-ai**
    * Role: **redshift-role-curso-bigdata-ai**
* El cluster puede tardar unos minutos en arrancar, podemos ver el estado en el listado de clusters
