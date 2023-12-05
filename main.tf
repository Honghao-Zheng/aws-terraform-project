module "networking" {
  source             = "./modules/networking"
  cidr_range         = "10.0.0.0/20"
  vpc_name           = "smart-home-vpc"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
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
  server_names       = var.server_names

}

module "database" {
  source = "./modules/database"
}