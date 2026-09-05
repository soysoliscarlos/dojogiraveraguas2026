# #############################################
# Variables - Configuración general de Azure
# #############################################
variable "subscription_id" {
  description = "Azure Subscription ID where resources will be deployed."
  type        = string
}

# #############################################
# Variables - Configuración de despliegue y etiquetado
# #############################################
variable "environment" {
  description = "Environment identifier used for resource tagging."
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}

# ###############################
# Variables - Resource Group RAC
# ###############################
variable "resource_group_name" {
  description = "Name of the resource group for the RAG workload."
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources."
  type        = string
  default     = "eastus"
}

# #################################
# Variables - Storage Account RAC
# #################################
variable "storage_account_name" {
  description = "Name of the storage account used by the RAG workload."
  type        = string
  default     = ""
}

variable "container_name" {
  description = "Name of the storage container within the storage account."
  type        = string
  default     = ""
}

variable "container_access_type" {
  description = "Access type for the storage container (private, blob, or container)."
  type        = string
  default     = "private"
}

# #############################
# Variables - Key Vault del RAC
# #############################
variable "key_vault_name" {
  description = "Name for the Azure Key Vault."
  type        = string
  default     = ""
}

variable "key_vault_sku" {
  description = "Key Vault SKU (standard or premium)."
  type        = string
  default     = "standard"
}

# #########################################
# Variables - Azure AI Services (Cognitive)
# #########################################
variable "ai_services_name" {
  description = "Name for the Azure AI Services resource associated with the hub."
  type        = string
  default     = ""
}

variable "ai_services_custom_subdomain_name" {
  description = "Custom subdomain for Azure AI Services."
  type        = string
  default     = ""
}

variable "ai_services_sku_name" {
  description = "SKU for Azure AI Services."
  type        = string
  default     = "S0"
}

# ##########################################
# Variables - Azure OpenAI (Modelo)
# ##########################################
variable "openai_deployment_name" {
  description = "Name of the GPT-5 model deployment."
  type        = string
  default     = ""
}

variable "openai_model_name" {
  description = "Model name for the Azure OpenAI deployment."
  type        = string
  default     = "gpt-5"
}

variable "openai_model_version" {
  description = "Version string for the GPT-5 deployment."
  type        = string
  default     = "2024-05-01"
}

variable "openai_scale_capacity" {
  description = "Capacity for the GPT-5 deployment."
  type        = number
  default     = 1
}

# ######################################
# Variables - Azure AI Foundry (Hub/Proj)
# ######################################
variable "ai_foundry_hub_name" {
  description = "Name of the Azure AI Foundry hub."
  type        = string
  default     = ""
}

variable "ai_foundry_project_name" {
  description = "Name of the Azure AI Foundry project."
  type        = string
  default     = ""
}
