variable "security_group_ids" {
  type        = list(string)
  description = "Provide security groups id numbers"

}
variable "public_subnet_ids" {
  type        = list(string)
  description = "Provide subnet id"
}

variable "server_names" {
  type        = list(string)
  description = "A list of server names"
}

variable "ssh_key_name" {
  type = string
  description = "The key name for accessing the server using ssh"
  default = "tf-key"
  sensitive = true
}

variable "ami" {
  type = string
  description = "The AMI name for the instances"
}

variable "instance_type" {
  type = string
  description = "The type of the EC2 instances"
}