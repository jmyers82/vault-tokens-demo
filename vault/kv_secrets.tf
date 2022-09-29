resource "vault_kv_secret_v2" "secret" {
  provider    = vault.cloud
  mount                      = vault_mount.kvv2.path
  name                       = "hashiconf"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    hashiconfsecret       = "hashiconfRocks!",
  }
  )
}

resource "vault_kv_secret_v2" "secret" {
  provider    = vault.cloud
  mount                      = vault_mount.kvv2.path
  name                       = "hashiswag"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    whohas       = "the-most-swag!"
  }
  )
}


#### POLICY to READ secret
resource "vault_policy" "kv_read_policy" {
  for_each = local.subscriptions
  provider = vault.cloud
  name     = "kv_read_secrets"

  policy = <<EOT

path "secret/data/*" {
  capabilities = ["read"]
}

path "auth/token/*" {
  capabilities = ["create","update"]
}

EOT
}