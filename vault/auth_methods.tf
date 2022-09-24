resource "vault_auth_backend" "approle" {
  provider = vault.cloud
  type     = "approle"
}


resource "vault_approle_auth_backend_role" "aws_secrets" {
  provider       = vault.cloud
  backend        = vault_auth_backend.approle.path
  role_name      = "aws-role"
  token_policies = ["default"] #"aws-create", "aws-update"]
}

resource "vault_approle_auth_backend_role" "azure_secrets" {
  provider       = vault.cloud
  backend        = vault_auth_backend.approle.path
  role_name      = "azure-role"
  token_policies = ["default"] #"azure-create", "azure-update"]
}