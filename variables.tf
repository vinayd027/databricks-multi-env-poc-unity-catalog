variable "location" {
  type        = string
  description = "Azure region for the resources"
  default     = "UK South"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "databricks_workspace_id" {
  type        = string
  description = "id of Databricks workspace"
}

variable "databricks_catalog" {
  type        = string
  description = "databricks unity catalog name"
  default     = "db-dge-poc-unity-catalog"
}

variable "metastore" {
  type        = string
  description = "metastore name"
  default     = "db-dge-poc-metastore"
}

variable "azure_client_id" {
  type        = string
  description = "Azure client ID for authentication"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure client secret for authentication"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure tenant ID for authentication"
}

variable "storage_account_name" {
  type        = string
  description = "Azure storage account name"
}

variable "prefix" {
  type        = string
  description = "Prefix used for the resources"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure tenant ID for authentication"
}