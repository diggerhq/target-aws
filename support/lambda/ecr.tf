
resource "aws_ecr_repository" "lambda_repo" {
  name                 = "${var.project_name}-${var.environment}"
  image_tag_mutability = var.image_tag_mutability
}
