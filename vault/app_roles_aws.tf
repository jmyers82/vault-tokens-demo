resource "vault_aws_secret_backend" "aws" {
  provider                  = vault.cloud
  access_key                = var.aws_access_key
  secret_key                = var.aws_secret_key
  region                    = "us-west-1"
  default_lease_ttl_seconds = 14400
  max_lease_ttl_seconds     = 28800
  path                      = "aws"
  description               = "aws secret backend"

}


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

resource "vault_policy" "aws_create_auth" {
  for_each = local.accounts
  provider = vault.cloud
  name     = "aws_create_creds_${each.value.account_id}"

  policy = <<EOT
path "aws/creds/${each.value.account_id}" {
  capabilities = ["create"]
}

path "auth/token/create" {
  capabilities = ["create","update"]
}
EOT
}