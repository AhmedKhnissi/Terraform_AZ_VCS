variable "subscription_id" {
  description = "Azure subscription ID used for the lab."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region used for the lab."
  type        = string
  default     = "francecentral"
}

variable "project" {
  description = "Project short name."
  type        = string
  default     = "azdevsecops"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "region_short" {
  description = "Short Azure region code."
  type        = string
  default     = "frc"
}

variable "instance" {
  description = "Instance number."
  type        = string
  default     = "001"
}

variable "owner" {
  description = "Resource owner."
  type        = string
  default     = "ahmed"
}

variable "enable_acr" {
  description = "Enable Azure Container Registry creation. Disabled because Azure for Students policy blocks ACR creation."
  type        = bool
  default     = false
}