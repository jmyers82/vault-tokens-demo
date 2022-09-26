### AWS - ROLE AND POLICY FOR APP TEAMS CI/CD TO USE TO GET TEMPORARY CREDENTIALS
resource "vault_approle_auth_backend_role" "app_role_aws_auth_role" {
  for_each       = local.accounts
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "aws-read-${each.value.account_id}"
  token_policies = ["aws_read_${each.value.account_id}"]
}

resource "vault_policy" "app_role_aws_policy" {
  for_each = local.accounts
  provider = vault.cloud
  name     = "aws_read_${each.value.account_id}"

  policy = <<EOT

path "aws/creds/${each.value.account_id}" {
  capabilities = ["read"]
}

EOT
}


#### AWS - ROLE AND POLICY FOR LANDING ZONE PIPELINE TO CREATE THE ROLES / POLICIES / CREDENTIALS ###
resource "vault_approle_auth_backend_role" "aws_secrets" {
  for_each       = local.accounts
  provider       = vault.cloud
  backend        = vault_auth_backend.app_role_backend_auth.path
  role_name      = "aws-create-role"
  token_policies = ["aws_create_creds_${each.value.account_id}"] #"aws-create", "aws-update"]
}

resource "vault_policy" "azure_create_auth" {
  for_each = local.accounts
  provider = vault.cloud
  name     = "aws_create_creds_${each.value.sub_id}"

  policy = <<EOT
path "aws/creds/*" {
  capabilities = ["create"]
}

path "auth/token/create" {
  capabilities = ["create","update"]
}
EOT
}