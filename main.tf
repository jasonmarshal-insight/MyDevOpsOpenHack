terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "${ secrets.TFSTATE_RESOURCES_GROUP_NAME }"
    storage_account_name = "${ secrets.TFSTATE_STORAGE_ACCOUNT_NAME }"
    container_name       = "${ secrets.TFSTATE_STORAGE_CONTAINER_NAME }"
    key                  = "${ secrets.TFSTATE_KEY }"
  }
}

provider "azurerm" {
  features {}
}

# Your code goes here

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}

