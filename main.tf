terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}

resource "azurerm_resource_group" "rg1" {
    name = "terraform-rg"
    location = "southeastasia"
}

output "resourcegroup" {
    value = "${azurerm_resource_group.rg1.name}"
}
