output "vm_id" {
  description = "Ops VM ID."
  value       = azurerm_linux_virtual_machine.this.id
}

output "private_ip_address" {
  description = "Ops VM private IP."
  value       = azurerm_network_interface.this.private_ip_address
}