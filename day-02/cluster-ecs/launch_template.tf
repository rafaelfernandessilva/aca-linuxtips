resource "aws_launch_template" "on_demand" {
  name_prefix   = "${var.project_name}-on-demand"
  image_id      = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.main.id
  ]


  iam_instance_profile {
    name = aws_iam_instance_profile.main.name
  }

  update_default_version = true

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-on-demand"
    }
  }
  user_data = base64encode(templatefile("${path.module}/templates/user_data.tpl", {
    ECS_CLUSTER = var.project_name
  }))

  depends_on = [
    aws_iam_role.main

  ]
}

