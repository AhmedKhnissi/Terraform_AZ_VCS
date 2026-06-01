# ADR-006 - OIDC Federation Strategy

## Statut
Accepté

## Contexte
Les plateformes externes comme HCP Terraform et GitHub Actions doivent accéder à Azure pour créer l’infrastructure ou déployer l’application.

La méthode classique consiste à utiliser un Service Principal avec client secret, mais cela crée un secret long terme à stocker et à renouveler.

## Décision
Le projet utilisera OIDC federation quand c’est possible.

Deux identités seront prévues :

| Identité | Plateforme | Usage |
|---|---|---|
| app-azdevsecops-hcp-terraform-dev | HCP Terraform | Terraform plan/apply |
| app-azdevsecops-github-actions-dev | GitHub Actions | Build, push image, déploiement applicatif |

## Raisons
- Éviter les secrets statiques.
- Utiliser des tokens temporaires.
- Limiter les permissions par scope.
- Séparer l’infrastructure et le déploiement applicatif.
- Se rapprocher d’un modèle DevSecOps moderne.

## Conséquences
- HCP Terraform aura ses propres federated credentials.
- GitHub Actions aura ses propres federated credentials.
- Les rôles Azure seront donnés au minimum nécessaire.
- Les secrets client ne seront pas stockés dans GitHub ni HCP Terraform.