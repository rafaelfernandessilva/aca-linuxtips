resource "aws_ssm_parameter" "lb_arn" {
  name  = "/aca_tips_ecs/lb/arn"
  value = aws_lb.main.arn
  type  = "String"
}


resource "aws_ssm_parameter" "lb_listerner" {
  name  = "/aca_tips_ecs/lb/listerner"
  value = aws_lb_listener.http.arn
  type  = "String"
}

