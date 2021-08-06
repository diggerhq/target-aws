
variable "vpc_id" {}
variable "subnet_a_id" {}
variable "subnet_b_id" {}

variable "cluster_name" {}
variable "eks_node_max" {}
variable "eks_node_min" {}
variable "eks_node_desired" {}

variable "node_instance_type" {
  default = "t3.small"
}