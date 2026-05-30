#!/usr/bin/env bash
set -euo pipefail

echo "=== Azure Account Context ==="
az account show --output table

echo
echo "=== Active Subscription Details ==="
az account show --query "{name:name, id:id, tenantId:tenantId, user:user.name}" --output json

echo
echo "=== Current Azure CLI Version ==="
az version --output table