resource "aws_iam_role" "main" {
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


resource "aws_iam_role_policy" "ecs_task_execution_policy" {
  name = "${var.service_name}-policy"
  role = aws_iam_role.main.id
  policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup",
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "s3:GetObject",
          "sqs:*",
        ],
        Resource = "*",
        Effect   = "Allow"
      },
    ]
  }


  )
}