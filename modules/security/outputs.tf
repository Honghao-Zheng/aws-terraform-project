output "security_group_id" {
  description = "The security group ID number of the smart home server"
  value       = aws_security_group.smart_home_server.id
}