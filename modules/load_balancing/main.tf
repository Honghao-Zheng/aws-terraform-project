resource "aws_lb_target_group" "smart_home_services" {
  count            = length(var.service_names)
  name             = "${var.service_names[count.index]}-service"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id
  health_check {
    healthy_threshold   = 5
    interval            = 5
    path                = "/"
    matcher             = "200"
    unhealthy_threshold = 2
    timeout             = 4
  }
}

resource "aws_lb_target_group_attachment" "smart_home_services" {
  count            = length(var.service_instances_ids)
  target_group_arn = aws_lb_target_group.smart_home_services[count.index].arn
  target_id        = var.service_instances_ids[count.index]
}


resource "aws_lb" "smart_home_servers" {
  name               = "smart-home-servers"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.aws_public_subnet_ids

}

resource "aws_lb_listener" "smart_home_servers" {
  load_balancer_arn = aws_lb.smart_home_servers.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.smart_home_services[2].arn
  }
}

resource "aws_lb_listener_rule" "heating" {
  listener_arn = aws_lb_listener.smart_home_servers.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.smart_home_services[1].arn
  }

  condition {
    path_pattern {
      values = ["/api/heating*"]
    }
  }
}

resource "aws_lb_listener_rule" "lights" {
  listener_arn = aws_lb_listener.smart_home_servers.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.smart_home_services[0].arn
  }

  condition {
    path_pattern {
      values = ["/api/lights*"]
    }
  }

}

resource "aws_autoscaling_group" "smart_home_servers" {

  count            = length(var.launch_templat_ids)
  name_prefix      = "${var.service_names[count.index]}_auto_scaling"
  desired_capacity = 1
  max_size         = 2
  min_size         = 1
  launch_template {
    id      = var.launch_templat_ids[count.index]
    version = "$Latest"
  }
  vpc_zone_identifier = var.aws_public_subnet_ids
}

resource "aws_autoscaling_attachment" "smart_home_servers" {
  count                  = length(aws_autoscaling_group.smart_home_servers)
  autoscaling_group_name = aws_autoscaling_group.smart_home_servers[count.index].id
  lb_target_group_arn    = aws_lb_target_group.smart_home_services[count.index].arn
}



