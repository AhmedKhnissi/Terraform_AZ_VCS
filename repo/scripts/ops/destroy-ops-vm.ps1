param(
  [string]$ResourceGroupName = "rg-azdevsecops-dev-frc-001",
  [string]$VmName = "vm-azdevsecops-ops-dev-frc-001"
)

Write-Host "Deleting VM $VmName in RG $ResourceGroupName..." -ForegroundColor Red

az vm delete `
  --resource-group $ResourceGroupName `
  --name $VmName `
  --yes

Write-Host "Check and delete unattached disks, NICs and public IPs if needed." -ForegroundColor Yellow