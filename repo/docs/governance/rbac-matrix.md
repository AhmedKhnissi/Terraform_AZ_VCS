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


## Azure RBAC

| Scope | Principal | Role | Justification |
|---|---|---|---|
| Subscription | grp-azdevsecops-platform-admins | Reader | Voir le contexte global sans gérer toute la subscription |
| RG core | grp-azdevsecops-platform-admins | Contributor | Gérer les ressources du lab |
| RG core | grp-azdevsecops-readers | Reader | Audit et lecture seule |
| ACR | app-azdevsecops-github-actions-dev | AcrPush | Push des images CI/CD |
| ACR | AKS kubelet identity | AcrPull | Pull des images par les nodes AKS |
| Key Vault | AKS workload identity | Key Vault Secrets User | Lire les secrets applicatifs |
| AKS | grp-azdevsecops-developers | Azure Kubernetes Service Cluster User Role | Connexion utilisateur au cluster |

## Kubernetes RBAC cible

| Namespace | Groupe | Accès |
|---|---|---|
| platform | grp-azdevsecops-platform-admins | admin |
| apps | grp-azdevsecops-developers | edit |
| apps | grp-azdevsecops-readers | view |
| security | grp-azdevsecops-security | view |
| observability | grp-azdevsecops-security | view |
| observability | grp-azdevsecops-platform-admins | admin |

## Principes

- Pas d’attribution directe aux utilisateurs sauf exception.
- Attribution aux groupes Entra.
- Scope minimal.
- Séparation infra, applicatif et sécurité.
- OIDC préféré aux secrets.