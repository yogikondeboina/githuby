terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "terraform"
        storage_account_name = "tfstorefile"
        container_name       = "tfstbackend01"
        key                  = "terraform.tfstate"
    }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}

# module "storage_account" {
#   source = ".azservices/storageaccount"
#   location = var.location
#   resource_group = var.azurerm_resource_group
#   storage_name = var.azurerm_storage_account
#   resource_group_name = var.resource_group_name
#   azurem_storage_account = var.azurem_storage_account 
# }