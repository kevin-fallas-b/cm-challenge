#!/bin/bash

#Instalar NginX
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl enable nginx

#Traernos proyecto de github y colocarlo en servidor
cd tmp
sudo git clone https://github.com/kevin-fallas-b/terraform-challenge.git

#mover pagina de ubicacion temoral a nginx
sudo mv -v terraform-challenge/website/* /var/www/html

#Eliminar pagina index por defecto de nginx
cd /var/wwww/html
sudo rm index.nginx-debian.html


