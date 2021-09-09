

{% if environment_config.lambda_service_exists %}

  resource "aws_ecr_repository" "support_lambda_repo" {
    name                 = "${var.app}-${var.environment}"
    image_tag_mutability = "MUTABLE"
  }

  # TODO: if routing is enabled for project use the routing gateway
  # instead of creating one
  resource "aws_api_gateway_rest_api" "support_lambda_gateway" {
    name = "${var.app}-${var.environment}"
  }


  resource "aws_iam_role" "default_iam_for_lambda" {
    name_prefix = "${var.app}-${var.environment}"

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
  EOF
  }

  resource "aws_iam_role_policy_attachment" "role_attach_lambdavpc" {
    role = aws_iam_role.default_iam_for_lambda.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  }

{% endif %}