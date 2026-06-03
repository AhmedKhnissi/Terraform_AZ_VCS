module "rg_core" {
  source = "../../modules/resource-group"

  name     = "rg-${local.name_prefix}"
  location = var.location
  tags     = local.common_tags
}

module "acr" {
  source = "../../modules/acr"

  name                = "azdevsecopsdev001"
  resource_group_name = module.rg_core.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
  tags                = local.common_tags
}