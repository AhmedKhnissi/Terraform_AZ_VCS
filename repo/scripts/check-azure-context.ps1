Write-Host "=== Azure Account Context ===" -ForegroundColor Cyan
az account show --output table

Write-Host "`n=== Active Subscription Details ===" -ForegroundColor Cyan
az account show --query "{name:name, id:id, tenantId:tenantId, user:user.name}" --output json

Write-Host "`n=== Current Azure CLI Version ===" -ForegroundColor Cyan
az version --output table


#New-Item -ItemType Directory -Force infra/envs/dev     creation dossier  
#New-Item -ItemType Directory -Force infra/modules/resource-group  creation dossier