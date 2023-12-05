run "allow_ingress" {

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv4.cidr_ipv4 == "0.0.0.0/0"
    error_message = "Does not allow all IPv4 origins"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv6.cidr_ipv6 == "::/0"
    error_message = "Does not allow all IPv6 origins"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv4.from_port == 80 && aws_vpc_security_group_ingress_rule.allow_http_ipv4.to_port == 80
    error_message = "Port Forwarding for 80 not set up for ipv4"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_app_port_ipv4.from_port == 3000 && aws_vpc_security_group_ingress_rule.allow_app_port_ipv4.to_port == 3000
    error_message = "Port Forwarding for app port 3000 not set up for ipv4"
  }


  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_ssh.from_port == 22 && aws_vpc_security_group_ingress_rule.allow_ssh.to_port == 22
    error_message = "Port Forwarding for ssh port 22 not set up"
  }


  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv6.from_port == 80 && aws_vpc_security_group_ingress_rule.allow_http_ipv6.to_port == 80
    error_message = "Port Forwarding for 80 not set up for ipv6"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_app_port_ipv6.from_port == 3000 && aws_vpc_security_group_ingress_rule.allow_app_port_ipv6.to_port == 3000
    error_message = "Port Forwarding for app port 3000 not set up for ipv6"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv4.security_group_id == aws_security_group.smart_home_server.id
    error_message = "ingress rule for ipv4 not added to the correct group"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv6.security_group_id == aws_security_group.smart_home_server.id
    error_message = "ingress rule for ipv6 not added to the correct group"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv4.ip_protocol == "tcp"
    error_message = "Rule not accepting the correct protocol for ipv4"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http_ipv6.ip_protocol == "tcp"
    error_message = "Rule not accepting the correct protocol for ipv6"
  }
}


run "egress-control" {

  assert {
    condition     = aws_vpc_security_group_egress_rule.allow_outgoing_ipv4.cidr_ipv4 == "0.0.0.0/0"
    error_message = "Does not allow all IPv4 origins"
  }

  assert {
    condition     = aws_vpc_security_group_egress_rule.allow_outgoing_ipv6.cidr_ipv6 == "::/0"
    error_message = "Does not allow all IPv6"
  }

  assert {
    condition     = aws_vpc_security_group_egress_rule.allow_outgoing_ipv4.security_group_id == aws_security_group.smart_home_server.id
    error_message = "egress rule not added to the correct group for ipv4"
  }

  assert {
    condition     = aws_vpc_security_group_egress_rule.allow_outgoing_ipv6.security_group_id == aws_security_group.smart_home_server.id
    error_message = "egress rule not added to the correct group for ipv6"
  }

  assert {
    condition     = aws_vpc_security_group_egress_rule.allow_outgoing_ipv4.ip_protocol == "-1"
    error_message = "Rule not accepting the all protocols for ipv4"
  }

    assert {
    condition     = aws_vpc_security_group_egress_rule.allow_outgoing_ipv6.ip_protocol == "-1"
    error_message = "Rule not accepting the all protocols for ipv6"
  }
}
