#!/bin/bash

# Ajustes no sistema
yum update -y
mkdir /srv/solution
timedatectl set-timezone America/Fortaleza

# Instalação do Docker e do Compose
amazon-linux-extras install nginx1 -y
systemctl enable nginx.service
systemctl start nginx.service

yum install docker -y
systemctl enable docker.service
systemctl start docker.service
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
chmod -v +x /usr/local/bin/docker-compose

# # Escrita do Docker Compose
# cat <<EOF > /srv/solution/docker-compose.yml
# #script aqui!!!
# EOF


#!/bin/bash

# Ajustes no sistema
yum update -y
mkdir /srv/solution
timedatectl set-timezone America/Fortaleza

# Instalação do NFS
sudo yum install amazon-efs-utils -y

# Instalação Docker e compose
yum install docker -y
systemctl enable docker.service
systemctl start docker.service
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m) -o /usr/bin/docker-compose && sudo chmod 755 /usr/bin/docker-compose

# Execução do compose
docker-compose -f /srv/solution/docker-compose.yaml up -d
