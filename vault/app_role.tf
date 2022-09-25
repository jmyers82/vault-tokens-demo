resource "vault_auth_backend" "app_role_backend_auth" {
  provider    = vault.cloud
  type        = "approle"
  description = "AppRole Auth for Azure"

  tune {
    max_lease_ttl      = "90000s"
    listing_visibility = "unauth"
  }
}

resource "vault_approle_auth_backend_role" "aws_secrets" {
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "aws-create-role"
  token_policies = ["default"] #"aws-create", "aws-update"]
}

resource "vault_approle_auth_backend_role" "azure_secrets" {
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "azure-create-role"
  token_policies = ["default"] #"azure-create", "azure-update"]
}

resource "vault_approle_auth_backend_role" "app_role_azure_auth_role" {
  for_each       = local.subscriptions
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "azure-read-${each.value.sub_id}"
  token_policies = ["azure_read_${each.value.sub_id}"]
}



resource "vault_policy" "app_role_ado_policy" {
  for_each = local.subscriptions
  provider = vault.cloud
  name     = "azure_read_${each.value.sub_id}"

  policy = <<EOT

path "azure/creds/${each.value.sub_id}" {
  capabilities = ["read"]
}

EOT
}