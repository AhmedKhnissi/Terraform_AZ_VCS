# Ops VM Lifecycle Runbook

## Objectif

La VM d’ops sert de jumpbox ou de runner temporaire pour les tâches Cloud/DevSecOps.

## Règles

- Ne pas laisser la VM allumée sans usage.
- Déallouer la VM en fin de session si elle doit être réutilisée.
- Détruire la VM si elle n’est plus nécessaire.
- Vérifier les disques, NIC et IP publiques après suppression.
- Ne jamais stocker de secrets longue durée sur la VM.

## Cas où la VM n'existe pas encore

Si la commande suivante retourne `ResourceNotFound`, cela signifie que la VM d’ops n’a pas encore été créée.

```powershell
az vm get-instance-view `
  --resource-group rg-azdevsecops-dev-frc-001 `
  --name vm-azdevsecops-ops-dev-frc-001 `
  --query "instanceView.statuses[].displayStatus" `
  -o table

## Déallouer la VM

```powershell
.\scripts\ops\deallocate-ops-vm.ps1