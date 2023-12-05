output "smart_home_servers_names" {
  description = "A list of server names"
  value       = aws_instance.smart_home_servers[*].tags
}

output "smart_home_servers_dns" {
  description = "A list of server public dns"
  value       = aws_instance.smart_home_servers[*].public_dns
}

output "instance_ids" {
  description = "List of IDs of instances"
  value       = aws_instance.smart_home_servers[*].id
}


