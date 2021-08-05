

variable "project_name" {}

variable "environment" {}

variable "service_name" {}

variable "ecr_repo" {}

variable "api_gateway" {}

variable "api_gateway_trigger" {
  default = true
}

variable "timeout" {
  default = 15
}

variable "image_uri" {
}

variable "lambda_role" {
  default = null
}

variable "vpc_subnet_ids" {
  default = []
}

variable "vpc_security_groups" {
  default = []
}

variable "dockerfile_command" {
  default = ["app.handler"]
}