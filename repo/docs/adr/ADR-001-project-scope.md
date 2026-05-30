# ADR-001 - Project Scope

## Statut
Accepté

## Contexte
Le projet vise à simuler le travail réel d’un ingénieur Cloud/DevSecOps sur Azure, avec un abonnement Azure for Students.

## Décision
Le projet construira une plateforme DevSecOps de lab autour d’une application Python conteneurisée, déployée sur AKS, avec IaC Terraform, CI/CD GitHub Actions, registre ACR, Key Vault, Workload Identity, policies Kubernetes, observabilité, autoscaling et procédures de teardown.

## Hors périmètre
- Production 24/7
- SLA de production
- Architecture multi-région
- Environnement haute disponibilité complet
- Charges lourdes ou permanentes
- Services coûteux gardés actifs sans raison

## Objectifs professionnels
- Pratiquer Terraform Cloud avec workflow VCS.
- Structurer une plateforme Azure modulaire.
- Automatiser le build et le déploiement applicatif.
- Sécuriser les secrets et les déploiements Kubernetes.
- Documenter les choix d’architecture.
- Maîtriser les coûts et la suppression des ressources.