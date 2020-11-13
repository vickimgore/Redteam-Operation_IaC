# Redteam Operation Infrastucture as a Code

## Descripción

## Prerequisitos

* Dominio (example.org)
* Cuenta Linode
* Ansible 2.9.x (Para mitogen, no soporta versiones superiores)
* Terraform >= 13

## Instalación

´´´
git clone --recurse-submodules https://github.com/vickimgore/Redteam-Operation_IaC
cd Redteam-Operation_IaC
´´´

## Configuración

´´´bash
cp terraform.tfvar.example terraform.tfvar
´´´

## Editar **terraform.tfvar**
´´´
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
´´´

´´´bash
cp secrets.tfvar.example secrets.tfvar
´´´

Editar **secrets.tfvar**
´´´
linode_token = ""
´´´
# Talks

    [ ](https://youtu.be/lqSWOakmnqA?t=5384)

# TODO

    - [x] Despliegue automatico de infrastructura
    - [x] Despliegue de imagenes y docker-compose automatico
    - [x] Correcion problemas detectados en sslh
    - [x] Correcion de logica y orden de servicios
    - [x] Mejorar tiempos de despliegue
    - [ ] Incorporar role para openvpn
    - [ ] Agregar reglas custom post despliegue
