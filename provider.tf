terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "databricks" {
  # azure_workspace_resource_id = var.databricks_workspace_id
  alias         = "account"
  host          = "https://accounts.azuredatabricks.net"
  account_id    = "af587e06-4e3e-4d83-943d-68e7f131287d" #var.account_id
  client_id     = "71b0fdda-fef1-408d-825b-a2eb553af2c3"
  client_secret = "doseab7f00895be4df582bf268795f398e17"
}

provider "azurerm" {
  features {}
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}