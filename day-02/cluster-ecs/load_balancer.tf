resource "aws_security_group" "lb" {
  name   = "${var.project_name}-load-balancer"
  vpc_id = data.aws_ssm_parameter.vpc.value

  tags = {
    Name = "${var.project_name}-load-balancer"
  }
}

resource "aws_vpc_security_group_egress_rule" "this" {
  security_group_id = aws_security_group.lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

}

resource "aws_vpc_security_group_ingress_rule" "this" {
  security_group_id = aws_security_group.lb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


resource "aws_lb" "main" {
  name               = "${var.project_name}-ingress"
  internal           = var.load_balancer
  load_balancer_type = var.load_balancer_type

  subnets = [
    data.aws_ssm_parameter.subnet_public_1a.value,
    data.aws_ssm_parameter.subnet_public_1b.value,
    data.aws_ssm_parameter.subnet_public_1c.value

  ]

  security_groups = [

    aws_security_group.lb.id
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "aca-tips"
      status_code  = "200"
    }
  }
}