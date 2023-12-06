variable "vpc_id" {
  description = "a vpc id number"
  type        = string
}

variable "security_group_id" {
  description = "the security group id numbers"
  type        = string
}
variable "aws_subnet_public_ids" {
  description = "a list of public subnets id numbers"
  type        = list(string)
}

variable "service_names" {
  description = "A list of service names"
  type        = list(string)
}

variable "service_instances_ids" {
  description = "A list of ID numbers of serveice instances"
  type        = list(string)
}
