
resource "azurerm_key_vault" "hashi_vault" {
  name                        = "hashivaultdemo"
  location                    = azurerm_resource_group.hashi_terraform_demo.location
  resource_group_name         = azurerm_resource_group.hashi_terraform_demo.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
  enable_rbac_authorization = true

}

resource "azurerm_key_vault_secret" "example" {
  name         = "hashiconf-secret"
  value        = "${data.vault_kv_secret_v2.secret_hashiconf.data["Name"]}"
  key_vault_id = azurerm_key_vault.hashi_vault.id
}