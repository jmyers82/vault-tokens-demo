


resource "vault_auth_backend" "app_role_backend_auth" {
  provider    = vault.cloud
  type        = "approle"
  description = "AppRole Auth for AWS / Azure"

  tune {
    max_lease_ttl      = "90000s"
    listing_visibility = "unauth"
  }
}