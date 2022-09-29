resource "vault_mount" "kvv2" {
  provider    = vault.cloud
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "secret_conf" {
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

resource "vault_kv_secret_v2" "secret_swag" {
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