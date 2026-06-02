packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 2"
    }
  }
}

source "azure-arm" "ops_ubuntu" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  managed_image_resource_group_name = var.managed_image_resource_group_name
  managed_image_name                = var.managed_image_name

  temp_resource_group_name = "rg-azdevsecops-packer-tmp-dev-frc-001"

  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts-gen2"
  image_version   = "latest"

  location = var.location
  vm_size  = var.vm_size

  ssh_username = "packer"

  azure_tags = {
    project     = "azdevsecops"
    environment = "dev"
    owner       = "ahmed"
    managed_by  = "packer"
    lifecycle   = "temporary"
    role        = "ops-image"
  }
}

build {
  name    = "azdevsecops-ops-ubuntu"
  sources = ["source.azure-arm.ops_ubuntu"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y software-properties-common python3 python3-pip python3-venv",
      "sudo python3 -m pip install --upgrade pip",
      "sudo python3 -m pip install ansible"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "../../ansible/playbooks/ops-base.yml"
    role_paths = [
      "../../ansible/roles/ops_tools",
      "../../ansible/roles/ssh_hardening"
    ]
  }
}