Write-Host "=== Azure Account Context ===" -ForegroundColor Cyan
az account show --output table

Write-Host "`n=== Active Subscription Details ===" -ForegroundColor Cyan
az account show --query "{name:name, id:id, tenantId:tenantId, user:user.name}" --output json

Write-Host "`n=== Current Azure CLI Version ===" -ForegroundColor Cyan
az version --output table

#mkdir
#New-Item -ItemType Directory -Force infra/envs/dev     creation dossier  
#New-Item -ItemType Directory -Force infra/modules/resource-group  creation dossier


#   variable_env | echo
#$SUBSCRIPTION_ID = az account show --query id -o tsv
#$TENANT_ID = az account show --query tenantId -o tsv

#Write-Host "Subscription: $SUBSCRIPTION_ID"
#Write-Host "Tenant: $TENANT_ID"
