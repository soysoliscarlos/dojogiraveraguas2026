terraform {
  required_version = ">= 1.15.0"

  backend "azurerm" {
    resource_group_name  = "rg-veraguas2026-GEN-06"
    storage_account_name = "stgveraguas2026gen06"
    container_name       = "tfstate-user1"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "2.7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}
