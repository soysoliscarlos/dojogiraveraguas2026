resource "azapi_resource" "connection_api_key" {
  type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01-preview"
  parent_id = azurerm_ai_foundry.hub.id
  name      = "conn-api-key"

  body = {
    properties = {
      category = "AIServices",
      target   = azurerm_cognitive_account.rag.endpoint
      authType = "ApiKey",
      credentials = {
        key = azurerm_cognitive_account.rag.primary_access_key
      }
      isSharedToAll = true,
      metadata = {
        ApiType    = "Azure",
        ResourceId = azurerm_cognitive_account.rag.id
      }
    }
  }
  response_export_values = ["*"]
}
