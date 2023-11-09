module "network" {
  source = "../Modules/network"
}

module "rds" {
  source              = "../Modules/rds"
  security_group_rds  = module.security-groups.security_rds
  my_subnet_private01 = module.network.subnet-private-01
  my_subnet_private02 = module.network.subnet-private-02
  depends_on = [ module.network ]
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
output "rds_user" {
  value = module.rds.rds_user
}
output "rds_passwd" {
  value = module.rds.rds_passwd
  sensitive = true
}
output "rds_name" {
  value = module.rds.rds_name
}

module "efs" {
  source              = "../Modules/efs"
  security_group_efs  = module.security-groups.security_efs
  my_subnet_private01 = module.network.subnet-private-01
  my_subnet_private02 = module.network.subnet-private-02
  depends_on = [ module.rds ]
}

output "dns_name" {
  value = module.efs.dns_name
}

module "security-groups" {
  source = "../Modules/security-groups"
  vpc_id = module.network.vpc_id
  depends_on = [ module.network ]
}

module "auto-scaling-group" {
  source              = "../Modules/auto-scaling-group"
  sec_group           = module.security-groups.security_private
  my_subnet_private01 = module.network.subnet-private-01
  my_subnet_private02 = module.network.subnet-private-02
  depends_on = [ module.efs ]
}

module "app-load-balancer" {
  source           = "../Modules/application-load-balancer"
  vpc_id           = module.network.vpc_id
  security_public  = module.security-groups.security_public
  subnet_public_01 = module.network.subnet-public-01
  subnet_public_02 = module.network.subnet-public-02
  asg_name         = module.auto-scaling-group.asg_name
  depends_on = [ module.auto-scaling-group ]
}