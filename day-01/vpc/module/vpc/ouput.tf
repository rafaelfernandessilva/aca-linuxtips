output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc.id
}


output "private_1a" {
  value = aws_ssm_parameter.database_subnet_1a.id
}

output "private_1b" {
  value = aws_ssm_parameter.database_subnet_1b.id
}

output "private_1c" {
  value = aws_ssm_parameter.database_subnet_1c.id
}

output "public_1a" {
  value = aws_ssm_parameter.public_1b.id
}

output "public_1b" {
  value = aws_ssm_parameter.public_1b.id
}

output "public_1c" {
  value = aws_ssm_parameter.public_1c.id
}

output "database_subnet_1a" {
  value = aws_ssm_parameter.database_subnet_1a.id
}

output "database_subnet_1b" {
  value = aws_ssm_parameter.database_subnet_1b.id
}

output "database_subnet_1c" {
  value = aws_ssm_parameter.database_subnet_1c.id
}

