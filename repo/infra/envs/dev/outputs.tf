output "resource_group_name" {
  description = "Main resource group name."
  value       = module.rg_core.name
}

output "resource_group_id" {
  description = "Main resource group ID."
  value       = module.rg_core.id
}


output "acr_name" {
  description = "Azure Container Registry name."
  value       = var.enable_acr ? module.acr[0].name : null
}

output "acr_login_server" {
  description = "Azure Container Registry login server."
  value       = var.enable_acr ? module.acr[0].login_server : null
}