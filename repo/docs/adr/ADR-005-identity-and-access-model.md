# ADR-005 - Identity and Access Model

## Statut
Accepté

## Contexte
Le projet doit simuler une plateforme Cloud/DevSecOps réaliste sur Azure avec séparation des responsabilités entre admins plateforme, développeurs, sécurité et lecture seule.

## Décision
Le projet utilisera Microsoft Entra ID comme référentiel d’identité principal.

Les accès Azure seront gérés avec Azure RBAC.

Les accès Kubernetes seront gérés avec Microsoft Entra ID intégré à AKS et Kubernetes RBAC.

## Groupes Entra

| Groupe | Usage |
|---|---|
| grp-azdevsecops-platform-admins | Administration plateforme |
| grp-azdevsecops-developers | Déploiement applicatif |
| grp-azdevsecops-security | Contrôle sécurité et conformité |
| grp-azdevsecops-readers | Lecture seule / audit |

## Modèle AKS prévu

- Entra ID pour l’authentification.
- Kubernetes RBAC pour les droits dans les namespaces.
- Namespace `platform` pour les composants plateforme.
- Namespace `apps` pour les applications.
- Namespace `security` pour OPA Gatekeeper et policies.
- Namespace `observability` pour monitoring/logging.

## Conséquences
- Les accès sont attribués aux groupes, pas directement aux utilisateurs.
- Les droits sont limités par scope.
- Les identités techniques utilisent OIDC ou managed identity.
- Aucun secret statique ne doit être utilisé pour les pipelines lorsque OIDC est possible.