# resource "vault_auth_backend" "app_role_backend_auth" {
#   provider    = vault.cloud
#   type        = "approle"
#   description = "AppRole Auth for ADO"

#   tune {
#     max_lease_ttl      = "90000s"
#     listing_visibility = "unauth"
#   }
# }

# resource "vault_approle_auth_backend_role" "app_role_auth_role" {
#   provider       = vault.cloud
#   backend        = vault_auth_backend.app_role_backend_auth.path
#   role_name      = "ado-role-acquire-tokens"
#   token_policies = ["ado_app_role"]
# }



# resource "vault_policy" "app_role_ado_policy" {
#   provider = vault.cloud
#   name     = "ado_app_role"

#   policy = <<EOT
# path "auth/approle/ado-role-acquire-tokens" {
#   capabilities = ["read"]
# }

# path "azure/creds/${each.value.sub_id}" {
#   capabilities = ["read"]
# }

# path "auth/token/create" {
#   capabilities = ["create","update"]
# }
# EOT
# }