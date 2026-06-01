terraform {
  required_version = ">= 1.6.0"

  cloud {
    organization = "AZ-Brd-VCS"

    workspaces {
      name = "azdevsecops-dev"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}