# Redteam Operation Infrastucture as a Code

## Descripción

## Prerequisitos

* Dominio (example.org)
* Cuenta Linode
* Ansible 2.9.x (Para mitogen, no soporta versiones superiores)
* Recomendado usar virtualenv
* Terraform >= 13

## Instalación

```bash
git clone --recurse-submodules https://github.com/vickimgore/Redteam-Operation_IaC
cd Redteam-Operation_IaC
```

## Configuración

### Configurar el entorno virtual

```bash
virtualenv --python=3.8.6 .
source bin/activate
pip install -r requirements.txt
```

### Copiar el ejemplo terraform.tfvar

```bash
cp terraform.tfvar.example terraform.tfvar
```

### Editar terraform.tfvar

```bash
#For Instance
image = "linode/centos7"
label = "0x7e4"
region = "us-east"
type = "g6-nanode-1"
#sudo user
username = "someuser"
#Ansible Variables
ANSIBLE_DEBUG = "0"
#Remote Variables
hostname = "0x7e4"
DOMAIN = "example.org"
#remote working directory
WORKDIR = "/opt/docker"
```

### Copiar el ejemplo de secrets.tfvar

```bash
cp secrets.tfvar.example secrets.tfvar
```

### Editar secrets.tfvar

```bash
linode_token = ""
```

### Inicio terraform

```bash
terraform init
```

### Validacion

```bash
terraform plan -var-file=terraform.tfvar -var-file=secrets.tfvar
```

### Ejecucion

```bash
terraform apply -var-file=terraform.tfvar -var-file=secrets.tfvar
```

### Destruccion

```bash
terraform destroy -var-file=terraform.tfvar -var-file=secrets.tfvar
```


## Charlas

[Pwning networks on 10 min or less - Hackeemting Yacuiba 2020 - ES](https://youtu.be/lqSWOakmnqA?t=5384)

## TODO

- [x] Despliegue automatico de infrastructura
- [x] Despliegue de imagenes y docker-compose automatico
- [x] Correcion problemas detectados en sslh
- [x] Correcion de logica y orden de servicios
- [x] Mejorar tiempos de despliegue
- [ ] Incorporar role para openvpn
- [ ] Agregar reglas custom post despliegue
