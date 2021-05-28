
{% if environment_config.needs_elasticsearch %}

  locals {
    account_id = data.aws_caller_identity.current.account_id
    es_domain_name = "${var.ecs_cluster_name}-${var.environment}"
    event_stream = aws_cloudwatch_event_rule.ecs_event_stream.name
  }

  module "elasticsearch" {
    source = "../elasticsearch-module"
    domain_name = local.es_domain_name
  }

  data "aws_caller_identity" "current" {}


  resource "aws_iam_role" "es_lambda_role" {
    name_prefix = "${var.project_name}-${var.environment}-es-lambda-role"

    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": [
                    "es:*"
                ],
                "Effect": "Allow",
                "Resource": "arn:aws:es:${var.region}:${local.account_id}:domain/${local.es_domain_name}/*"
            }
        ]
    }
    EOF
  }

  # map to cloudwatch stream
  resource "aws_cloudwatch_log_subscription_filter" "test_lambdafunction_logfilter" {
    name            = "${var.ecs_cluster_name}-${var.environment}-elasticsearch-stream"
    role_arn        = aws_iam_role.es_lambda_role.arn
    log_group_name  = local.event_stream
    filter_pattern  = "{ $.path != \"/api/v1/hello\" }"
    destination_arn = module.elasticsearch.domain_arn
  }

  



  output "DGVAR_ES_DOMAIN" {
    value = module.elasticsearch.domain
  }

  output "DGVAR_ES_MASTER_USERNAME" {
    value = module.elasticsearch.master_username
  }

  output "DGVAR_ES_MASTER_PASSWORD" {
    value = module.elasticsearch.master_password
  }

{% endif %}