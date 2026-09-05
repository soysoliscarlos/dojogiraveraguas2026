resource "azurerm_key_vault" "rag" {
  name                = "${var.key_vault_name}-${random_string.prefix.result}"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = lower(var.key_vault_sku)

  # Habilitar RBAC para autorización
  rbac_authorization_enabled = true

  tags = local.etiquetas_comunes

}

# Asignar el rol de Key Vault Administrator
resource "azurerm_role_assignment" "kv_admin" {
  scope                = azurerm_key_vault.rag.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}
