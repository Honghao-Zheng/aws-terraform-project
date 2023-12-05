resource "aws_instance" "lighting_servers" {
  subnet_id                   = var.public_subnet_ids[0]
  ami                         = "ami-0505148b3591e4c07"
  vpc_security_group_ids      = var.security_group_ids
  instance_type               = "t2.micro"
  key_name                    = "tf-key"
  associate_public_ip_address = true
  tags = {
    Name      = "lighting_server_000"
    ManagedBy = "Terraform"
  }
}

