resource "vault_policy" "aws_read_auth" {
  for_each = local.subscriptions
  provider = vault.cloud
  name     = "aws_read_creds_${each.value.sub_id}"

  policy = <<EOT
path "aws/sts/${each.value.sub_id}" {
  capabilities = ["read"]
}

EOT
}


