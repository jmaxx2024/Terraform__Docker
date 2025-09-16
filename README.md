# Desplegacion en entorno DEV con Terraform + Docker

## Integrantes G11:

- MAXIMILIANO VILLANUEVA JHON
- TERRONES ALAYO, MAURICIO FABIAN
- RIOS TAMAYO, MARVIN
- VILLAJULCA QUISPE, DIEGO ALONSO
- BENJAMIN REYES, LUIS

Este repositorio contiene la configuración de infraestructura como código (IaC) para desplegar un entorno de desarrollo (DEV) utilizando Terraform y Docker.

## Servicios incluidos
- 3 Apps (Nginx)
- Redis
- PostgreSQL
- Grafana - puerto: 3000

Todo el despliegue está contenido en código y versionado en este repositorio.

## Estructura del proyecto

```bash
Terraform_Docker/
├── README.md              # Leeme
├── grafana.tf             # feat: Creando contenedor Docker para Grafana
├── main.tf                # feat: Estructura base
├── network.tf             # feat: Crear redes Docker para app, persistence y monitoreo
├── nginx.tf               # feat:Modificando el archivo y agregando los dos contenedores nginx (app2 y app3)
├── persistence.tf         # fear: Agregar contenedores Docker para postgre y redis
├── terraform.tfvars       # feat: Agregar variables de puertos para las aplicaciones nginx, redis, postgres, redis
└── variables.tf           # feat: Declarando las variables para nginx, redis, postgres, grafana
```

## Requisitos
Antes de comenzar, asegúrate de tener:
- Docker instalado
- Terraform v1.13.2
  on windows_amd64
- Git

# Instrucciones de despliegue
## 1. Clonar el repositorio

```bash
git clone https://github.com/jmaxx2024/Terraform__Docker.git
cd Terraform__Docker
```

## 2. Inicializar Terraform

```bash
terraform init
```

## 3. Revisar las variables

Puedes personalizar ```terraform.tfvars``` para definir los puertos internos y externos de diferentes apps.

Puedes personalizar ```variables.tf``` para definir usuario/contraseña de PostgreSQL, etc.

## 4. Aplicar el despliegue
plan: Muestra un plan de ejecución.
```bash
terraform plan
```
appy: Aplica los cambios del plan y despliega la infraestructura.
```bash
terraform apply
```
destroy: Destruye todo lo que Terraform creó en el workspace actual.
```bash
terraform destroy
```

## 6. Acceder a los servicios

# Accede a Grafana
En tu navegador:
```bas
hhttp://localhost:3000
```

Usuario/contraseña por defecto:

user: admin

password: admin

Al entrar, Grafana te pedirá cambiar la contraseña, sigue el proceso.

# Verifica los contenedores activos
```bash
docker ps
```

# Accede a NGINX
```bash
http://localhost:8081

http://localhost:8082

http://localhost:8083
```

# Accede a PostgreSQL

Conéctate usando un cliente, ejemplo: psql o DBeaver en:

Host: localhost

Puerto: 5432

Usuario: postgres

Contraseña: contrasena123456

# Accede a Redis

  Es necesario que tengas instalado el CLI de Redis y ejecuta

```bash
redis-cli -h localhost -p 6379
```

# Destruir el entorno
Cuando ya no necesites el entorno de desarrollo, simplemente ejecuta:

```bash
terraform destroy -auto-approve
```

# Arquitectura del despliegue
La siguiente imagen representa la arquitectura del entorno desplegado:
<img width="772" height="575" alt="Image" src="https://github.com/user-attachments/assets/341f6b2d-ef8b-4810-be49-4ecda438403a" />
