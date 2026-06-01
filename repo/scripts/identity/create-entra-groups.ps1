$groups = @(
  "grp-azdevsecops-platform-admins",
  "grp-azdevsecops-developers",
  "grp-azdevsecops-security",
  "grp-azdevsecops-readers"
)

foreach ($group in $groups) {
  Write-Host "Checking group: $group" -ForegroundColor Cyan

  $existing = az ad group list `
    --display-name $group `
    --query "[0].id" `
    -o tsv

  if ([string]::IsNullOrEmpty($existing)) {
    Write-Host "Creating group: $group" -ForegroundColor Green
    az ad group create `
      --display-name $group `
      --mail-nickname $group `
      --description "Azure DevSecOps lab group: $group"
  }
  else {
    Write-Host "Group already exists: $group ($existing)" -ForegroundColor Yellow
  }
}