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

output "dns_name" {
  value = module.efs.dns_name
}