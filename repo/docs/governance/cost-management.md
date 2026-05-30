# Cost Management Strategy

## Contraintes

Le projet utilise Azure for Students avec crédit limité. L’objectif est de pratiquer des scénarios Cloud/DevSecOps réalistes sans garder de ressources coûteuses inutilement.

## Règles FinOps

1. Créer un budget dès le Jour 1.
2. Utiliser un seul environnement `dev`.
3. Détruire AKS après les sessions de test.
4. Éviter les ressources 24/7.
5. Vérifier le coût estimé avant tout apply Terraform.
6. Garder ACR et ressources peu coûteuses si nécessaire, mais supprimer les clusters, VMs, gateways, disques et logs coûteux.
7. Faire une vérification Cost Analysis le lendemain de chaque gros test.

## Budgets proposés

| Budget | Scope | Montant | Alertes |
|---|---|---:|---|
| budget-student-global | Subscription | 20 USD | 50%, 80%, 100% |
| budget-aks-lab | Resource Group AKS | 10 USD | 50%, 80%, 100% |
| budget-observability | Resource Group monitoring | 5 USD | 50%, 80%, 100% |

## Ressources à surveiller

- AKS node pools
- Managed disks
- Public IP
- Load Balancer
- Log Analytics ingestion
- Managed Prometheus
- Databases
- VPN Gateway
- Snapshots