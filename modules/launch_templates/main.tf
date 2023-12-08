resource "aws_ami_from_instance" "smart_home_servers" {
  count              = length(var.instance_ids[*])
  name               = "${var.service_names[count.index]}_server"
  source_instance_id = var.instance_ids[count.index]
}
resource "aws_launch_template" "smart_home_servers" {
  count                                = length(var.service_names)
  name                                 = var.service_names[count.index]
  image_id                             = aws_ami_from_instance.smart_home_servers[count.index].id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = var.ssh_key_name
  vpc_security_group_ids               = var.security_group_ids
}
