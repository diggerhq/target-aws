
variable "project_name" {}

variable "environment" {}

variable "region" {}

# The tag mutability setting for the repository
variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "The tag mutability setting for the repository (defaults to IMMUTABLE)"
}
