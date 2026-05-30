# RBAC Matrix

## Objectif

Définir les rôles nécessaires pour séparer les responsabilités Cloud, DevOps, Sécurité et Lecture seule.

## Groupes prévus

| Groupe | Rôle métier | Niveau d’accès |
|---|---|---|
| grp-azdevsecops-platform-admins | Admin plateforme | Gestion infra et AKS |
| grp-azdevsecops-developers | Développeurs | Déploiement applicatif limité |
| grp-azdevsecops-security | Sécurité | Lecture policies, Defender, logs |
| grp-azdevsecops-readers | Audit / lecture seule | Lecture uniquement |

## Scope Azure prévu

| Scope | Groupe | Rôle Azure prévu |
|---|---|---|
| Subscription | platform-admins | Contributor ou Owner temporaire si nécessaire |
| Resource Group principal | platform-admins | Contributor |
| Resource Group AKS | platform-admins | Contributor |
| Resource Group AKS | developers | Reader |
| Key Vault | workload identity | Key Vault Secrets User |
| ACR | AKS kubelet identity | AcrPull |
| ACR | GitHub OIDC identity | AcrPush |

## Scope Kubernetes prévu

| Namespace | Groupe | Accès |
|---|---|---|
| platform | platform-admins | admin |
| apps | developers | edit |
| security | security | read |
| observability | platform-admins/security | read/admin selon besoin |

## Décision

Le projet utilisera Microsoft Entra ID pour l’authentification AKS et Kubernetes RBAC pour les permissions dans le cluster.