##### 0 - Variables - Configuración general de Azure #####
# subscription_id se inyecta vía TF_VAR_subscription_id desde secrets.AZURE_SUBSCRIPTION_ID en los workflows
##### Variables - Configuración de despliegue y etiquetado #####
environment = "dev"
tags = {
  owner = "Carlos Solis"
}

##### Variables - Resource Group RAC #####
resource_group_name = "rg-veraguas2026-user1-06"
location            = "eastus2"

##### Variables - Storage Account RAC #####
storage_account_name  = "stgcarlos"
container_name        = "carloscontainer"
container_access_type = "private" #

##### Variables - Key Vault del RAC #####
key_vault_name = "kvtestcarlos" # ejemplo: "kvtestcarlos"
key_vault_sku  = "standard"     # ejemplo: "standard"


##### Variables - Azure AI Services (Cognitive) #####
ai_services_name                  = "ia-services-carlos"
ai_services_custom_subdomain_name = "iaservicescarlos"

##### Variables - Azure OpenAI (modelo) #####
openai_deployment_name = "gpt5nano"
openai_model_name      = "gpt-5-nano"
openai_model_version   = "2025-08-07"
openai_scale_capacity  = 1

##### Variables - Azure AI Foundry (Hub/Proj) #####
ai_foundry_hub_name     = "foundryhubcarlos"
ai_foundry_project_name = "foundryprojcarlos"
