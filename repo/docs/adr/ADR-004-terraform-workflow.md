# ADR-004 - Terraform Workflow

## Statut
Accepté

## Contexte
Le projet utilise Terraform pour provisionner l’infrastructure Azure. Le dépôt GitHub est la source de vérité du projet.

## Décision
Le projet utilisera HCP Terraform avec un workflow VCS connecté au dépôt GitHub.

Le working directory du workspace sera :

`infra/envs/dev`

L’apply sera manuel afin d’éviter toute création involontaire de ressources coûteuses.

## Raisons
- Centraliser l’état Terraform dans HCP Terraform.
- Garder l’historique des plans et apply.
- Déclencher les plans automatiquement depuis GitHub.
- Éviter les apply automatiques sur un abonnement Azure for Students.
- Se rapprocher d’un workflow professionnel utilisé en entreprise.

## Conséquences
- Les fichiers Terraform doivent être maintenus dans `infra/envs/dev`.
- Les secrets et IDs sensibles seront stockés comme variables sensibles dans HCP Terraform.
- Les changements d’infrastructure passeront par Git.
- Les ressources coûteuses nécessiteront une validation manuelle avant apply.