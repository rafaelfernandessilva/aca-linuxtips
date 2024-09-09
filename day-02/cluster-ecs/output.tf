output "dns_name" {
  value = aws_lb.main.dns_name
}

output "lb_ssm_arn" {
  value = aws_ssm_parameter.lb_arn.id
}

output "lb_ssm_listerner" {
  value = aws_ssm_parameter.lb_listerner.id
}