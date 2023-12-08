module "networking" {
  source             = "./modules/networking"
  cidr_range         = var.cidr_range
  vpc_name           = var.vpc_name
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "app_servers" {
  source             = "./modules/app_servers"
  security_group_ids = [module.security.security_group_id]
  public_subnet_ids  = module.networking.public_subnets_ids
  server_names       = var.service_names
  ssh_key_name       = var.ssh_key_name
  ami                = "ami-0505148b3591e4c07"
  instance_type      = var.instance_type
}

module "database" {
  source      = "./modules/database"
  table_names = var.table_names
}

module "launch_templates" {
  source             = "./modules/launch_templates"
  security_group_ids = [module.security.security_group_id]
  public_subnet_ids  = module.networking.public_subnets_ids
  service_names      = var.service_names
  instance_ids       = module.app_servers.instance_ids
  ssh_key_name       = var.ssh_key_name
  instance_type      = var.instance_type
}

module "load_balancing" {
  source                = "./modules/load_balancing"
  vpc_id                = module.networking.vpc_id
  service_instances_ids = module.app_servers.instance_ids
  security_group_id     = module.security.security_group_id
  aws_public_subnet_ids = module.networking.public_subnets_ids
  service_names         = var.service_names
  availability_zones    = var.availability_zones
  launch_templat_ids    = module.launch_templates.launch_templat_ids
  max_capacity          = var.max_capacity
  min_capacity          = var.min_capacity
  desired_capacity      = var.desired_capacity
}


