terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.63.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name = var.storage_account_name

  resource_group_name = azurerm_resource_group.resource_group.id
  location            = azurerm_resource_group.resource_group.location

  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
}
