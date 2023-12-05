output "vpc_id" {
    value=module.networking.vpc_id
}

output "lighting_server_public_DNS" {
  value = module.app_servers.lighting_servers.public_dns
}

output "lighting_DB_name" {
  value = module.database.lighting_table.name
}