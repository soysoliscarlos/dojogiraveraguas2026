resource "azurerm_cognitive_account" "rag" {
  name                  = "${random_string.prefix.result}-${var.ai_services_name}"
  location              = data.azurerm_resource_group.this.location
  resource_group_name   = data.azurerm_resource_group.this.name
  sku_name              = var.ai_services_sku_name
  custom_subdomain_name = "${random_string.prefix.result}${var.ai_services_custom_subdomain_name}"
  kind                  = "AIServices"

  # Habilitar identidad administrada
  identity {
    type = "SystemAssigned"
  }

  tags = local.etiquetas_comunes
}

resource "azurerm_cognitive_deployment" "rag" {
  name                 = var.openai_deployment_name
  cognitive_account_id = azurerm_cognitive_account.rag.id

  model {
    format  = "OpenAI"
    name    = var.openai_model_name
    version = var.openai_model_version
  }

  sku {
    name     = "GlobalStandard"
    capacity = var.openai_scale_capacity
  }
}
