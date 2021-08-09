
resource "aws_ecr_repository" "{{service_name}}_ecr" {
  name                 = "${var.ecs_cluster.name}-${var.service_name}"
  image_tag_mutability = true
}

output "{{service_name}}_docker_registry" {
  value = aws_ecr_repository.{{service_name}}_ecr.repository_url
}

