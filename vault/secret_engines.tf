

resource "vault_mount" "kvv2" {
  provider    = vault.cloud
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_auth_backend" "app_role_backend_auth" {
  provider    = vault.cloud
  type        = "approle"
  description = "AppRole Auth for AWS / Azure"

  tune {
    max_lease_ttl      = "90000s"
    listing_visibility = "unauth"
  }
}