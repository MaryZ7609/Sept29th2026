terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "RG1" {
  name     = "pmg_rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "example" {
  name                     = "pmg_stacc"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

