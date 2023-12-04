variable "cidr_range" {
  type        = string
  description = "the cidr range for the vpc"
}

variable "vpc_name" {
  type        = string
  description = "the name of the vpc"
}

variable "availability_zones" {
  type        = list(string)
  description = "a list of availability zones for the vpc"
}

variable "public_subnets" {
  type        = list(string)
  description = "a list of public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "a list of private subnets"
}


