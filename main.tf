module "networking" {
  source             = "./modules/networking"
  cidr_range         = "10.0.0.0/20"
  vpc_name           = "smart-home-vpc"
  availability_zones = var.availability_zones
  public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "app_servers" {
  source             = "./modules/app_servers"
  security_group_ids = [module.security.security_group_id]
  public_subnet_ids  = module.networking.public_subnets
  server_names       = var.service_names

}

module "database" {
  source      = "./modules/database"
  table_names = var.table_names
}

module "load_balancing" {
  source                = "./modules/load_balancing"
  vpc_id                = module.networking.vpc_id
  service_instances_ids = module.app_servers.instance_ids
  security_group_id     = module.security.security_group_id
  aws_public_subnet_ids = module.networking.public_subnets
  service_names         = var.service_names
  availability_zones    = var.availability_zones
  launch_templat_ids = module.launch_templates.launch_templat_ids
}

module "launch_templates" {
  source             = "./modules/launch_templates"
  security_group_ids = [module.security.security_group_id]
  public_subnet_ids  = module.networking.public_subnets
  service_names       = var.service_names
  instance_ids       = module.app_servers.instance_ids
}
