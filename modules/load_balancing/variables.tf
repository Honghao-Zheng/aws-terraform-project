variable "vpc_id" {
  description = "a vpc id number"
  type        = string
}

variable "security_group_id" {
  description = "the security group id numbers"
  type        = string
}
variable "aws_public_subnet_ids" {
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

variable "availability_zones" {
  type        = list(string)
  description = "A list of avalibility zone to apply to the autoscaling group"
}

variable "launch_templat_ids" {
  type        = list(string)
  description = "A list of launch-template ID numbers"
}

variable "desired_capacity" {
  type        = number
  description = "The desired number of instances running under normal traffic condition with auto scaling"
}

variable "max_capacity" {
  type        = number
  description = "The maximum number of instances can be scaled up to with auto scaling"
}
variable "min_capacity" {
  type        = number
  description = "The minimum number of instances must be running with auto scaling"
}
