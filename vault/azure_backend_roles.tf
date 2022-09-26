resource "vault_azure_secret_backend_role" "azure_contributor_role" {
  for_each = local.subscriptions
  provider = vault.cloud
  backend  = vault_azure_secret_backend.azure.path
  role     = format("%s_contributor", each.value.sub_id)
  ttl      = 14400
  max_ttl  = 28800

  azure_roles {
    role_name = "Contributor"
    scope     = "/subscriptions/${each.value.sub_id}"
  }
}