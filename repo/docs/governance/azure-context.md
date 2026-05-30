# Azure Context

## Current Azure Subscription Context

- Subscription name: Azure for Students
- Subscription ID: 5eeed83f-a1f4-4ae9-9417-6dac1157f19a
- Tenant ID: 91b56222-4f2f-49b9-b4ae-e7625a447f07
- Home Tenant ID: 91b56222-4f2f-49b9-b4ae-e7625a447f07
- Tenant default domain: 3il.fr
- Tenant display name: GROUPE 3IL
- Account: khnissia@3il.fr
- Azure offer: Azure for Students
- Subscription state: Enabled
- Is default subscription: True
- Credit strategy: lab only, destroy expensive resources after each session

## Governance Notes

This project uses an Azure for Students subscription for Cloud / DevSecOps lab activities.

Because the subscription is limited by student credits, all deployed resources must be cost-controlled. Expensive resources such as virtual machines, public IP addresses, load balancers, managed disks, container registries, databases and managed Kubernetes clusters must be avoided unless required, and destroyed after each lab session when they are no longer needed.

Terraform will use this subscription as the target environment for infrastructure deployment.

## Verification Commands

```powershell
az account list --output table
az account set --subscription "5eeed83f-a1f4-4ae9-9417-6dac1157f19a"
az account show --output table