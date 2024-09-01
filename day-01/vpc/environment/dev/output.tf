output "vpc" {
  value = module.vpc.ssm_vpc_id
}

output "private_1a" {
  value = module.vpc.private_1a
}

output "private_1b" {
  value = module.vpc.private_1b
}

output "private_1c" {
  value = module.vpc.private_1c
}

output "public_1a" {
  value = module.vpc.public_1a
}

output "public_1b" {
  value = module.vpc.public_1b
}

output "public_1c" {
  value = module.vpc.public_1c
}

output "database_subnet_1a" {
  value = module.vpc.database_subnet_1a
}

output "database_subnet_1b" {
  value = module.vpc.database_subnet_1b
}

output "database_subnet_1c" {
  value = module.vpc.database_subnet_1c
}