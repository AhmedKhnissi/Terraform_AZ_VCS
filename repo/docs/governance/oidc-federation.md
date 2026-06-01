# OIDC Federation Strategy

## Objectif

Éviter les secrets statiques entre les plateformes CI/CD et Azure.

## Flux prévus

### 1. HCP Terraform vers Azure

HCP Terraform utilisera une App Registration Microsoft Entra dédiée :

`app-azdevsecops-hcp-terraform-dev`

Cette application aura des federated credentials qui autorisent HCP Terraform à obtenir un token temporaire pendant les runs Terraform.

Aucun client secret ne doit être stocké dans HCP Terraform.

### 2. GitHub Actions vers Azure

GitHub Actions utilisera une App Registration Microsoft Entra dédiée :

`app-azdevsecops-github-actions-dev`

Cette application aura une federated credential limitée au dépôt GitHub du projet et à la branche `main`.

Aucun client secret ne doit être stocké dans GitHub.

## Séparation des responsabilités

| Identité | Usage | Permissions |
|---|---|---|
| app-azdevsecops-hcp-terraform-dev | Provisionner infra Azure | Contributor sur RG projet |
| app-azdevsecops-github-actions-dev | Build/push/deploy applicatif | AcrPush sur ACR, accès limité AKS plus tard |
| AKS workload identity | Lire les secrets applicatifs | Key Vault Secrets User |
| AKS kubelet identity | Pull images | AcrPull |

## Règle

Les secrets statiques sont interdits sauf exception temporaire documentée.