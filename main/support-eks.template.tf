

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


output "DGVAR_EKS_API_ENDPOINT" {
  value = module.support_eks.endpoint
}

output "DGVAR_EKS_KUBECONFIG_CERTIFICATE_AUTHORITY_DATA" {
  value = module.support_eks.kubeconfig-certificate-authority-data
  sensitive = true
}

{% endif %}