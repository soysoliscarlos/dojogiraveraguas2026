# The main.tf file has been replaced with individual resource files.
# All resources are now defined directly in their respective files:
# - Resource group: (to be created)
# - Storage: storage.tf
# - Key Vault: key_vault.tf
# - AI Services: ai_services.tf
# - Azure OpenAI: cognitive_account.tf
# - AI Foundry Hub: ai_foundry_hub.tf
# - AI Foundry Project: ai_foundry_project.tf

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
