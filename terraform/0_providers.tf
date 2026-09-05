provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = false
    }
    cognitive_account {
      purge_soft_delete_on_destroy = false
    }
  }
}

provider "azapi" {
  subscription_id = var.subscription_id
}
