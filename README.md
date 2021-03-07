# Despliegue de VM con Terraform en VMware

En este respsitorio se describe el procedimiento para desplegar mediante Terraform una nueva VM con dos adaptadores de red y arranque desde ISO para el provider VMware.

La VM creada en el ejemplo cuenta con:

- 1 CPU
- 1G de RAM
- 10G de disco
- Sistema operativo FreeBSD
- 2 Interfaces de red
- ISO pfSense-CE-2.3.5-RELEASE-amd64
- Nombre de la VM Pfsense

# Requisitos

- Terraform 0.12 o superior

- VMware 6.5 o superior

# Uso

Una vez instalado Terraform crearemos el directorio donde copiaremos los ficheros main.tf y variables.tf. 

En el fichero main.tf debemos modificar la siguiente información:

- name_dc (Nombre del DC donde desplegar la VM)
- name_datastore (Nombre del Data store que queremos usar)
- name_pool (Nombre del pool al que va a pertenecer la VM)
- Nombre de los dos adaptadores de red, en nuestro caso "VM Network" y "Red Usuarios"

En el fichero variables.tf debemos indicar los datos de conexión para el provider VMware.

Una vez modificados los dos ficheros con los valores correspondientes inicializaremos el proyecto mediante el comando terraform init

Posteriormente ejecutaremos terraform plan, mediante este comando crearemos el plan de ejecución y posteriormente determinará que acciones son necesarias para llevar a cabo las tareas especificadas en el fichero de configuración.

Por último mediante el comando terraform apply con el que se creará la VM con todos los datos que se ha indicado en el fichero de configuración main.tf
