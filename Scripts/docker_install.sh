#!/bin/bash

# Ajustes no sistema
yum update -y
mkdir /srv/solution
timedatectl set-timezone America/Fortaleza

# Instalação do Docker e do Compose
yum install docker
systemctl enable docker.service
systemctl start docker.service
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
chmod -v +x /usr/local/bin/docker-compose

# Escrita do Docker Compose
cat <<EOF > /srv/solution/docker-compose.yml
#script aqui!!!
EOF