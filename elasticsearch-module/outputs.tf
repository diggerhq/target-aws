
output "domain" {
  value = var.app_env
}

output "master_username" {
  value = local.es_username
}

output "master_password" {
  value = local.es_password
}
