
variable "table_names" {
  description = "A list of service names"
  default     = ["lighting", "heating"]
}

variable "service_names" {
  description = "A list of service names"
  default     = ["lighting", "heating", "status"]
}

variable "availability_zones" {
  description = "A list of avalibility zones for the servers"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "ssh_key_name" {
  type        = string
  description = "The key name for accessing the server using ssh"
  sensitive   = true
}

variable "instance_type" {
  type        = string
  description = "The type of the EC2 instances"
  default     = "t2.micro"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "smart-home-vpc"
}

variable "cidr_range" {
  description = "The range of CIDR"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets"
  type        = list(string)
}

variable "desired_capacity" {
  type        = number
  description = "The desired number of instances running under normal traffic condition with auto scaling"
  default     = 1
}

variable "max_capacity" {
  type        = number
  description = "The maximum number of instances can be scaled up to with auto scaling"
  default     = 2
}
variable "min_capacity" {
  type        = number
  description = "The minimum number of instances must be running with auto scaling"
  default     = 1
}
