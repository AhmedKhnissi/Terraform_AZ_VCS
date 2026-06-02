variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "location" {
  type    = string
  default = "francecentral"
}

variable "managed_image_resource_group_name" {
  type    = string
  default = "rg-azdevsecops-images-dev-frc-001"
}

variable "managed_image_name" {
  type    = string
  default = "img-azdevsecops-ops-ubuntu-001"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}