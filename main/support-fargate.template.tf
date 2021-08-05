

{% if fargate_service_exists %}

  module "support_fargate" {
    source = "../support/fargate"
    vpc_id = local.vpc.id
    ecs_cluster_name = var.ecs_cluster_name
  }


  locals {
    support_fargate_ecs_sg_id = module.support_fargate.security_group_id
  }
{% endif %}