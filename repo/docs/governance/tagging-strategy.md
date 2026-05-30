# Tagging Strategy

## Tags obligatoires

| Tag | Exemple | Objectif |
|---|---|---|
| project | azdevsecops | Identifier le projet |
| environment | dev | Distinguer dev/test/prod |
| owner | ahmed | Responsabilité |
| cost_center | student-lab | Suivi des coûts |
| managed_by | terraform | Gouvernance IaC |
| lifecycle | temporary | Savoir quoi supprimer |
| criticality | low | Classification |
| data_classification | internal | Sécurité |
| region | francecentral | Reporting régional |

## Exemple Terraform

```hcl
common_tags = {
  project             = "azdevsecops"
  environment         = "dev"
  owner               = "ahmed"
  cost_center         = "student-lab"
  managed_by          = "terraform"
  lifecycle           = "temporary"
  criticality         = "low"
  data_classification = "internal"
  region              = "francecentral"
}