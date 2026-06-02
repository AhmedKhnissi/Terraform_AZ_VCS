param(
  [string]$ResourceGroupName = "rg-azdevsecops-dev-frc-001",
  [string]$VmName = "vm-azdevsecops-ops-dev-frc-001"
)

Write-Host "Deallocating VM $VmName in RG $ResourceGroupName..." -ForegroundColor Yellow

az vm deallocate `
  --resource-group $ResourceGroupName `
  --name $VmName

Write-Host "VM deallocated. Compute billing should stop, but disks and static IPs may still incur costs." -ForegroundColor Green