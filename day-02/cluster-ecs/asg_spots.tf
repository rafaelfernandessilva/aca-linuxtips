resource "aws_autoscaling_group" "spots" {
  name_prefix = "${var.project_name}spots"
  vpc_zone_identifier = [
    data.aws_ssm_parameter.subnet_private_1a.value,
    data.aws_ssm_parameter.subnet_private_1b.value,
    data.aws_ssm_parameter.subnet_private_1c.value
  ]

  desired_capacity = var.cluster_spots_desired_size
  max_size         = var.cluster_spots_max_size
  min_size         = var.cluster_spots_min_size

  launch_template {
    id      = aws_launch_template.spots.id
    version = aws_launch_template.spots.latest_version
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-spots"
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManager"
    value               = true
    propagate_at_launch = true
  }
}


resource "aws_ecs_capacity_provider" "spots" {
  name = "${var.project_name}spots"

  auto_scaling_group_provider  {
    auto_scaling_group_arn = aws_autoscaling_group.spots.arn
    managed_scaling {
      maximum_scaling_step_size = 10
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 90

    }
  }

}