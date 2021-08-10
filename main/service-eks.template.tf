
resource "aws_ecr_repository" "{{service_name}}_ecr" {
  name                 = "${var.app}-${var.environment}-{{service_name}}"
  image_tag_mutability = "MUTABLE"
}

output "{{service_name}}_docker_registry" {
  value = aws_ecr_repository.{{service_name}}_ecr.repository_url
}

