resource "aws_iam_role" "service_execution_role" {
  name = "${var.cluster_name}-${var.service_name}-service-role"
  assume_role_policy = jsondecode({
    Version = "2012-1017"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Principal = {
                Service = "ecs-tasks.amazonaws.com"
            }
            Effect = "Allow"
            Sid = ""
        },

    ]
  }
 )
}

resource "aws_iam_role_policy" "name" {
  name = "${var.cluster_name}-${var.service_name}-service-role"
  role = aws_iam_role.service_execution_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
          "elasticloadbalancing:DeregisterTargets",
          "elasticloadbalancing:Describe*",
          "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
          "elasticloadbalancing:RegisterTargets",
          "ec2:Describe*",
          "ec2:AuthorizeSecurityGroupIngress",
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "ssm:GetParameters",
          "secretsmanager:GetSecretValue"
        ],
        Resource = "*",
        Effect   = "Allow"
      },
    ]
  }) 
}