variable "security_group_ids" {
  type        = list(string)
  description = "Provide security groups id numbers"

}
variable "public_subnet_ids" {
  type        = list(string)
  description = "Provide subnet id"
}

variable "service_names" {
  type        = list(string)
  description = "A list of service names"
}

variable "ssh_key_name" {
  type        = string
  description = "The key name for accessing the server using ssh"
  default     = "tf-key"
  sensitive   = true
}

variable "instance_ids" {
  description = "List of IDs of instances"
  type        = list(string)
}
