locals {
  name_prefix = "${var.project}-${var.environment}-${var.region_short}-${var.instance}"

  common_tags = {
    project             = var.project
    environment         = var.environment
    owner               = var.owner
    cost_center         = "student-lab"
    managed_by          = "terraform"
    lifecycle           = "temporary"
    criticality         = "low"
    data_classification = "internal"
    region              = var.location
  }
}