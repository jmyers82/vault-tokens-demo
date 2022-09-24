resource "vault_kv_secret_v2" "secret" {
  mount                      = vault_mount.kvv2.path
  name                       = "secret"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    zip       = "zap",
    foo       = "bar"
  }
  )
}