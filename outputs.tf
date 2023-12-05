output "vpc_id" {
  value = module.networking.vpc_id
}

output "smart_home_servers_names" {
  value = module.app_servers.smart_home_servers_names
}

output "servers_public_DNS" {
  value = module.app_servers.smart_home_servers_dns
}