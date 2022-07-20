terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tf-init-example-rg"
    storage_account_name = "tformstoracct"
    container_name       = env.storage_container_name
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


# Testing RG:
# resource "azurerm_resource_group" "state-demo-secure" {
#   name     = "state-demo"
#   location = "eastus"
# }