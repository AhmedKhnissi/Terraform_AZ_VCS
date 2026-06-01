output "resource_group_name" {
  description = "Main resource group name."
  value       = module.rg_core.name
}

output "resource_group_id" {
  description = "Main resource group ID."
  value       = module.rg_core.id
}