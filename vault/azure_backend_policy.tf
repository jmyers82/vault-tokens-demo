resource "vault_policy" "azure_read_auth" {
  for_each = local.subscriptions
  provider = vault.cloud
  name     = "azure_read_creds_${each.value.sub_id}"

  policy = <<EOT
path "azure/creds/${each.value.sub_id}" {
  capabilities = ["read"]
}

EOT
}


