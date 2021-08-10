

{% if environment_config.lambda_service_exists %}

  module "support_lambda" {
    source = "../support/lambda"
    project_name = var.app
    environment = var.environment
    region = var.region
    image_tag_mutability = "IMMUTABLE"
    image_uri = var.lambda_image_uri
  }

  # TODO: if routing is enabled for project use the routing gateway
  # instead of creating one
  resource "aws_api_gateway_rest_api" "support_lambda_gateway" {
    name = "${var.project_name}-${var.environment}"
  }



{% endif %}