resource "azurerm_storage_account" "terraform_demo_storage" {
  name                            = "st${var.map_environment.app_name}${var.map_environment.env_type}"
  resource_group_name             = azurerm_resource_group.terraform_demo.name
  location                        = var.map_storage_account.location
  account_tier                    = var.map_storage_account.account_tier
  account_replication_type        = var.map_storage_account.replication_type
  min_tls_version                 = var.map_storage_account.min_tls_version
  allow_nested_items_to_be_public = var.map_storage_account.allow_blob_public_access
  enable_https_traffic_only       = var.map_storage_account.enable_https_traffic_only
  access_tier                     = var.map_storage_account.access_tier

  identity {
    type = "SystemAssigned"
  }

  tags = var.map_tags
}