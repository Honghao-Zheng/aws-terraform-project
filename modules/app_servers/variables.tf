variable "security_group_ids" {
  type        = list(string)
  description = "provide security groups id numbers"

}
variable "public_subnet_ids" {
  type        = list(string)
  description = "provide subnet id"
}

