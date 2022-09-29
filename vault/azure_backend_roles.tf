resource "vault_azure_secret_backend" "azure" {
  provider                = vault.cloud
  use_microsoft_graph_api = true
  subscription_id         = "d995a747-3f1a-412a-bf34-655f5d44cc0f"
  tenant_id               = "46eb567a-7cf3-48cc-9a90-f6deab9bb040"
  client_id               = "df8d18ab-3c48-4697-9884-65ee95ed4ae6"
  client_secret           = var.azure_client_secret
  environment             = "AzurePublicCloud"
  path                    = "azure"
}

resource "vault_azure_secret_backend_role" "azure_contributor_role" {
  for_each = local.subscriptions
  provider = vault.cloud
  backend  = vault_azure_secret_backend.azure.path
  role     = "${each.value.sub_id}_contributor"
  # role     = format("%s_contributor", each.value.sub_id)
  ttl      = 14400
  max_ttl  = 28800

  azure_roles {
      role_name = "Contributor"
      scope     = "/subscriptions/${each.value.sub_id}"
    }
  azure_roles  {
      role_name = "Key Vault Secrets Officer"
      scope     = "/subscriptions/${each.value.sub_id}"
    }
}