# ADR-007 - Ops Image Standardization

## Statut
Accepté

## Contexte

Le projet nécessite un environnement d’administration standardisé pour exécuter des outils Cloud/DevSecOps comme Azure CLI, Terraform, Packer, Ansible, kubectl, Helm et Docker CLI.

## Décision

Une image Ubuntu dédiée sera construite avec Packer et configurée avec Ansible.

Cette image servira de base pour une VM d’ops ou une jumpbox temporaire.

## Raisons

- Standardiser l’environnement d’administration.
- Réduire les écarts entre machines.
- Automatiser l’installation des outils.
- Préparer un futur runner ou bastion léger.
- Éviter les installations manuelles non reproductibles.

## Sécurité

- Authentification SSH par clé uniquement.
- Login root SSH désactivé.
- Password authentication désactivée.
- fail2ban activé.
- auditd activé.
- UFW activé avec SSH autorisé.

## Contraintes de coût

La VM d’ops ne doit pas rester allumée sans usage.

Si elle doit être réutilisée, elle sera désallouée.

Si elle n’est plus nécessaire, elle sera détruite avec les ressources associées.