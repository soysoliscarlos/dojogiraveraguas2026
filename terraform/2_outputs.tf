output "resource_group_name" {
  description = "Name of the resource group hosting the RAG workload."
  value       = data.azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "Name of the storage account for RAG artifacts."
  value       = azurerm_storage_account.rag.name
}

output "key_vault_uri" {
  description = "URI of the Key Vault storing secrets for the RAG solution."
  value       = azurerm_key_vault.rag.vault_uri
}

# output "openai_endpoint" {
#   description = "Endpoint for the Azure OpenAI account hosting the GPT-5 deployment."
#   value       = azurerm_cognitive_account.rag.endpoint
# }

output "openai_deployment_name" {
  description = "Name of the GPT-5 Azure OpenAI deployment."
  value       = azurerm_cognitive_deployment.rag.name
}

output "ai_foundry_hub_name" {
  description = "Azure AI Foundry hub provisioned for the RAG workload."
  value       = azurerm_ai_foundry.hub.name
}

output "ai_foundry_project_name" {
  description = "Azure AI Foundry project name."
  value       = azurerm_ai_foundry_project.rag.name
}

# output "openai_key_secret_id" {
#   description = "ID of the Key Vault secret containing the Azure OpenAI key."
#   value       = var.store_openai_secret_in_key_vault ? azurerm_key_vault_secret.openai_primary_key[0].id : null
#   sensitive   = true
# }
