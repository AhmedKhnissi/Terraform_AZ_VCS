$groups = @(
  "grp-azdevsecops-platform-admins",
  "grp-azdevsecops-developers",
  "grp-azdevsecops-security",
  "grp-azdevsecops-readers"
)

foreach ($group in $groups) {
  Write-Host "`n=== Role assignments for $group ===" -ForegroundColor Cyan

  $groupId = az ad group show --group $group --query id -o tsv

  az role assignment list `
    --assignee $groupId `
    --all `
    --query "[].{role:roleDefinitionName, scope:scope}" `
    -o table
}