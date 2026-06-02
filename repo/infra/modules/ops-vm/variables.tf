variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "vm_name" {
  description = "Ops VM name."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the VM will be deployed."
  type        = string
}

variable "admin_username" {
  description = "Admin username."
  type        = string
  default     = "azureops"
}

variable "ssh_public_key" {
  description = "SSH public key."
  type        = string
  sensitive   = true
}

variable "source_image_id" {
  description = "Managed image ID created by Packer."
  type        = string
}

variable "vm_size" {
  description = "VM size."
  type        = string
  default     = "Standard_B1s"
}

variable "tags" {
  description = "Common tags."
  type        = map(string)
}