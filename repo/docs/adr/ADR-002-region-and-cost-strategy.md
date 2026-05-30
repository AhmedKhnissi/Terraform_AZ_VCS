# ADR-002 - Région et stratégie de coûts

## Statut
Accepté

## Contexte
Le projet est réalisé avec un abonnement Azure for Students. Le crédit est limité et le projet doit rester un lab d’apprentissage DevSecOps, non une plateforme de production.

## Décision
La région principale du projet sera `francecentral`.

Les ressources coûteuses, notamment AKS, bases managées, Load Balancer, machines virtuelles et observabilité avancée, seront créées uniquement pendant les sessions de test puis détruites ou désactivées.

## Raisons
- Réduire la latence depuis la France.
- Garder une région principale unique pour simplifier le réseau, les quotas et les coûts.
- Faciliter le tagging, le suivi budgétaire et la suppression des ressources.

## Conséquences
- Les modules Terraform utiliseront une variable `location = "francecentral"`.
- Les ressources bonus comme Virtual Nodes ou Kafka seront isolées et éphémères.
- Le teardown est obligatoire en fin de session AKS.