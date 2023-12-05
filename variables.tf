
variable "table_names" {
  type    = list(string)
  default = ["lighting", "heating"]
}

variable "server_names" {
  type    = list(string)
  default = ["lighting", "heating"]
}
