
resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eksnode-group.arn

  subnet_ids = [var.subnet_a_id, var.subnet_b_id]

  instance_types = [var.node_instance_type]

  scaling_config {
    desired_size = var.eks_node_desired
    max_size     = var.eks_node_max
    min_size     = var.eks_node_min
  }

  # Optional: Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eksnode-group-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eksnode-group-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eksnode-group-AmazonEC2ContainerRegistryReadOnly,
  ]
}