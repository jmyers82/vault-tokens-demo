data "azurerm_client_config" "current" {}

data "vault_kv_secret_v2" "secret_hashiconf" {
  mount = "kvv2"
  name  = hashiconf
}

data "vault_kv_secret_v2" "secret_hashiswag" {
  mount = "kvv2"
  name  = hashiswag
}