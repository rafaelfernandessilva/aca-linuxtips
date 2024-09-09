variable "region" {
  type = string

}

variable "project_name" {
  type = string
}


# ssm paramters #
variable "ssm_vpc_id" {}

variable "ssm_public_subnet_1a" {}

variable "ssm_public_subnet_1b" {}

variable "ssm_public_subnet_1c" {}

variable "ssm_private_subnet_1a" {}

variable "ssm_private_subnet_1b" {}

variable "ssm_private_subnet_1c" {}

# LB #

variable "load_balancer" {}

variable "load_balancer_type" {}



# ECS #

variable "ami" {}

variable "instance_type" {}

variable "volume_size" {}

variable "volume_type" {}

variable "cluster_ondemand_min_size" {}

variable "cluster_ondemand_max_size" {}

variable "cluster_ondemand_desired_size" {}

variable "cluster_spots_min_size" {}

variable "cluster_spots_max_size" {}

variable "cluster_spots_desired_size" {}