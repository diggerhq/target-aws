

resource "aws_ecs_cluster" "app" {
  name = var.ecs_cluster_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = var.tags
}

resource "aws_security_group" "ecs_service_sg" {
  name_prefix = "${var.ecs_cluster_name}-${var.environment}"
  description = "Security group shared by all ECS services"
  vpc_id      = var.vpc_id
}


output "ecs_cluster" {
  value = aws_ecs_cluster.app
}

output "security_group_id" {
  value = aws_security_group.ecs_service_sg.id
}