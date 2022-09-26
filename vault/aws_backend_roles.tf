# resource "vault_aws_secret_backend_role" "aws_contributor_role" {
#   for_each        = local.accounts
#   provider        = vault.cloud
#   backend         = vault_aws_secret_backend.aws.path
#   name            = "${each.value.account_id}_contributor"
#   credential_type = "assumed_role"
#   role_arns       = ["arn:aws:iam::${each.value.account_id}:role/vault_temp_role"]
# }