

{% if environment_config.eks_service_exists %}

  module "support_eks" {
    source = "../support/eks"
    vpc_id = local.vpc.id
    subnet_a_id = aws_subnet.public_subnet_a.id
    subnet_b_id = aws_subnet.public_subnet_b.id
    cluster_name = "${var.app}-${var.environment}"
    eks_node_max = 3
    eks_node_min = 2
    eks_node_desired = 2
    node_instance_type = "t3.small"
  }

  locals {
    support_fargate_ecs_sg_id = module.support_fargate.security_group_id
  }
{% endif %}