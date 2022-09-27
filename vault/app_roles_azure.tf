### AZURE - ROLE AND POLICY FOR APP TEAMS CI/CD TO USE TO GET TEMPORARY CREDENTIALS
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

path "azure/creds/${each.value.sub_id}_contributor" {
  capabilities = ["read"]
}

path "auth/token/create" {
  capabilities = ["create","update"]
}

EOT
}


#### AZURE - ROLE AND POLICY FOR LANDING ZONE PIPELINE TO CREATE THE ROLES / POLICIES / CREDENTIALS ###
resource "vault_approle_auth_backend_role" "azure_secrets" {
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "azure-create-role"
  token_policies = ["default"] #"azure-create", "azure-update"]
}
resource "vault_policy" "azure_create_auth" {
  for_each = local.subscriptions
  provider = vault.cloud
  name     = "azure_create_creds_${each.value.sub_id}"

  policy = <<EOT
path "azure/creds/*" {
  capabilities = ["create"]
}

path "auth/token/create" {
  capabilities = ["create","update"]
}
EOT
}