data "http" "myipaddr" {
   url = "http://icanhazip.com"
}
//the following creates a mock vpc, uncomment the followings to allow module testing while commenting out the aws_security_group resource and vpc_id variable 
# module "networking" {
#   source             = "../networking"
#   cidr_range         = "10.0.0.0/20"
#   vpc_name           = "smart-home-vpc"
#   availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
#   public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
#   private_subnets    = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
# }
# resource "aws_security_group" "smart_home_server" {
#   name        = "smart-home-server"
#   description = "Security group for smart home servers"
#   vpc_id      = module.networking.vpc_id
# }

//comment out this resource to allow module testing
resource "aws_security_group" "smart_home_server" {
  name        = "smart-home-server"
  description = "Security group for smart home servers"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv6" {
  security_group_id = aws_security_group.smart_home_server.id
  
  cidr_ipv6   = "::/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.smart_home_server.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_app_port_ipv6" {
  security_group_id = aws_security_group.smart_home_server.id

  cidr_ipv6   = "::/0"
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
}

resource "aws_vpc_security_group_ingress_rule" "allow_app_port_ipv4" {
  security_group_id = aws_security_group.smart_home_server.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.smart_home_server.id

  cidr_ipv4   = "${chomp(data.http.myipaddr.response_body)}/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_outgoing_ipv6" {
  security_group_id = aws_security_group.smart_home_server.id
  cidr_ipv6   = "::/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_outgoing_ipv4" {
  security_group_id = aws_security_group.smart_home_server.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}