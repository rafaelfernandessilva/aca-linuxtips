resource "aws_security_group" "main" {
  name   = "${var.project_name}-cluster"
  vpc_id = data.aws_ssm_parameter.vpc.value

  tags = {
    Name = "${var.project_name}-cluster"
  }
}

resource "aws_vpc_security_group_egress_rule" "sg_main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

}

resource "aws_vpc_security_group_ingress_rule" "sg_main" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "10.0.0.0/16"
  from_port   = 0
  ip_protocol = "tcp"
  to_port     = 0
}