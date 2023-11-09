data "terraform_remote_state" "local_state" {
  backend = "local"
  config = {
    path = "/home/joao/Documents/Terraform/Main/terraform.tfstate"
  }
}

resource "aws_launch_template" "my_template" {
  name_prefix            = "my_template"
  description            = "modelo de instância"
  image_id               = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sec_group]
  key_name               = var.key_name
  user_data = base64encode(<<-EOF
  #!/bin/bash
  
  # Ajustes no sistema.
  yum update -y

  # Diretórios
  mkdir /srv/solution
  mkdir -p /mnt/efs/wordpress

  # Timezone
  timedatectl set-timezone America/Fortaleza

  # Variáveis de ambiente.
  RDS_ENDPOINT="${data.terraform_remote_state.local_state.outputs.rds_endpoint}"
  RDS_USER="${data.terraform_remote_state.local_state.outputs.rds_user}"
  RDS_PASSWD="${data.terraform_remote_state.local_state.outputs.rds_passwd}"
  RDS_BDNAME="${data.terraform_remote_state.local_state.outputs.rds_name}"
  DNS_NAME="${data.terraform_remote_state.local_state.outputs.dns_name}"
  MOUNT_PATH="/mnt/efs/wordpress"
  
  # Funções.
  install_nfs() {
  yum install amazon-efs-utils -y
  systemctl enable --now nfs-utils.service
  }

  install_docker() {
  yum install docker -y
  systemctl enable --now docker.service
  curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m) -o /usr/bin/docker-compose && chmod 755 /usr/bin/docker-compose
  }
  
  # Instalação do NFS
  install_nfs

  # Instalação Docker e compose
  install_docker
  
  # Configuração EFS
  echo "$DNS_NAME:/ $MOUNT_PATH nfs defaults 0 0" >> /etc/fstab
  mount -a
  
  # Escrita do docker-compose
  cat <<EOF2 > /srv/solution/docker-compose.yml
  version: '3.3'
  services:
    wordpress:
      image: wordpress:latest
      volumes:
        - /mnt/efs/wordpress:/var/www/html
      ports:
        - 80:80
      restart: always
      environment:
        WORDPRESS_DB_HOST: "$RDS_ENDPOINT"
        WORDPRESS_DB_USER: "$RDS_USER"
        WORDPRESS_DB_PASSWORD: "$RDS_PASSWD"
        WORDPRESS_DB_NAME: "$RDS_BDNAME"
        WORDPRESS_TABLE_CONFIG: wp_
  EOF2

  # Execução do docker-compose
  docker-compose -f /srv/solution/docker-compose.yml up -d
  EOF  
  )

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_type = var.volume_type
      volume_size = var.volume_size
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name       = "docker-wordpress"
      Project    = "PB UFC"
      CostCenter = "C092000004"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name       = "docker-wordpress"
      Project    = "PB UFC"
      CostCenter = "C092000004"
    }
  }
}
