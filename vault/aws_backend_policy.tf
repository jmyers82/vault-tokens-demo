resource "vault_policy" "aws_read_auth" {
  for_each = local.subscriptions
  provider = vault.cloud
  name     = "aws_read_creds_${each.value.sub_id}"

  policy = <<EOT
path "aws/creds/${each.value.sub_id}" {
  capabilities = ["read"]
}

EOT
}


resource "vault_policy" "azure_create_auth" {
  for_each = local.subscriptions
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