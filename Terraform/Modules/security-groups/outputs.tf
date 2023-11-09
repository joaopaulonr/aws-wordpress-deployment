output "security_public" {
    value = aws_security_group.pratice_security_group_public.id
}

output "security_private" {
    value = aws_security_group.pratice_security_group_private.id
}

output "security_bastion" {
    value = aws_security_group.pratice_security_group_bastion.id
}

output "security_rds" {
    value = aws_security_group.pratice_security_group_rds.id
}
output "security_efs" {
    value = aws_security_group.pratice_security_group_efs.id
}