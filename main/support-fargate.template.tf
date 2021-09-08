

{% if environment_config.fargate_service_exists %}

  module "support_fargate" {
    app = var.app
    environment = var.environment
    region = var.region
    source = "../support/fargate"
    vpc_id = local.vpc.id
    ecs_cluster_name = var.ecs_cluster_name
  }

  locals {
    ecs_cluster = module.support_fargate.ecs_cluster
  }

  locals {
    support_fargate_ecs_sg_id = module.support_fargate.security_group_id
  }
{% endif %}