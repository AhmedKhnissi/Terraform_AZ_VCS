# Naming Convention

## Format général

`<resource-type>-<project>-<environment>-<region>-<instance>`

## Valeurs standards

| Élément | Valeur |
|---|---|
| Project | azdevsecops |
| Environment | dev |
| Region Azure | francecentral |
| Region short | frc |
| Instance | 001 |

## Exemples

| Ressource | Nom |
|---|---|
| Resource Group principal | rg-azdevsecops-dev-frc-001 |
| Resource Group AKS | rg-azdevsecops-aks-dev-frc-001 |
| Resource Group data | rg-azdevsecops-data-dev-frc-001 |
| Virtual Network | vnet-azdevsecops-dev-frc-001 |
| AKS subnet | snet-aks-dev-frc-001 |
| Private endpoints subnet | snet-pe-dev-frc-001 |
| Azure Container Registry | azdevsecopsdev001 |
| Key Vault | kv-azdevsecops-dev-frc-001 |
| AKS cluster | aks-azdevsecops-dev-frc-001 |
| Log Analytics Workspace | log-azdevsecops-dev-frc-001 |

## Règles

- Les noms doivent être prévisibles et lisibles.
- Les informations variables doivent aller dans les tags.
- Les ressources globalement uniques, comme ACR ou Storage Account, peuvent nécessiter un suffixe unique.
- Les ressources temporaires doivent contenir le tag `lifecycle = temporary`.