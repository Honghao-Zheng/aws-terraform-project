output "launch_templat_ids" {
  description = "A list of launch template ID numbers"
  value       = aws_launch_template.smart_home_servers[*].id
}


