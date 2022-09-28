resource "vault_approle_auth_backend_role" "app_role_token_refresh_role" {
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "token-refresh"
  token_policies = ["token_refresh"]
  secret_id_num_uses = 1
  secret_id_ttl = 3000
  token_ttl = 18000
}

resource "vault_policy" "app_role_refresh_policy" {
  provider = vault.cloud
  name     = "token-refresh-pipeline"

  policy = <<EOT

path "auth/approle/role/token-refresh-role/secret-id" {
  policy = "write"
  min_wrapping_ttl = 100
  max_wrapping_ttl = 3000
}

EOT
}

resource "vault_policy" "app_role_update_policy" {
  provider = vault.cloud
  name     = "token-refresh"

  policy = <<EOT

path "aws/sts/*" {
  capabilities = ["read"]
}

path "azure/creds/*" {
  capabilities = ["read"]
}

path "auth/token/create" {
  capabilities = ["create","update"]
}

EOT
}