resource "aws_instance" "smart_home_servers" {
  count                       = length(var.server_names)
  subnet_id                   = var.public_subnet_ids[count.index]
  ami                         = "ami-0505148b3591e4c07"
  vpc_security_group_ids      = var.security_group_ids
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true
  tags = {
    Name      = "${var.server_names[count.index]}_server"
    ManagedBy = "Terraform"
  }
}


