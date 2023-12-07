
variable "table_names" {
  description = "A list of service names"
  default = ["lighting", "heating"]
}

variable "service_names" {
  description = "A list of service names"
  default = ["lighting", "heating","status"]
}

variable "availability_zones" {
  description = "A list of avalibility zones for the servers" 
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}