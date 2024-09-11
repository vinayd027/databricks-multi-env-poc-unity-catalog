data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "databricks_storage" {
  name                     = "unitycatstac${random_string.storage_suffix.result}"
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #depends_on               = [azurerm_resource_group.this]
}

resource "random_string" "storage_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_container" "metastore" {
  name                  = var.metastore
  storage_account_name  = azurerm_storage_account.databricks_storage.name
  container_access_type = "private"
}

resource "databricks_metastore" "unity_catalog" {
  name         = "databricks-unity-catalog-metastore"
  storage_root = "abfss://${azurerm_storage_container.metastore.name}@${var.storage_account_name}.dfs.core.windows.net/"
  provider     = databricks.account
  region       = data.azurerm_resource_group.existing.location # Reference the desired region
}

resource "databricks_metastore_assignment" "this" {
  workspace_id         = var.databricks_workspace_id # Reference the existing workspace ID
  metastore_id         = databricks_metastore.unity_catalog.id
  provider             = databricks.account
  default_catalog_name = "hive_metastore"
}

# Create Unity Catalog
/*resource "databricks_catalog" "my_catalog" {
  name        = var.databricks_catalog
  comment     = "Unity Catalog"
  metastore_id = databricks_metastore.unity_catalog.id
}*/

# Assign permissions to the catalog
/*
resource "databricks_grants" "catalog_permissions" {
  catalog = databricks_catalog.my_catalog.name
  grant {
    principal  = "Data Scientists"
    privileges = ["USE_CATALOG", "SELECT"]
  }
  grant {
    principal  = "Data Engineers"
    privileges = ["USE_SCHEMA", "CREATE_FUNCTION", "CREATE_TABLE", "EXECUTE", "MODIFY", "SELECT"]
  }
}*/
