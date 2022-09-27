resource "vault_aws_secret_backend" "aws" {
  provider                  = vault.cloud
  access_key                = var.aws_access_key
  secret_key                = var.aws_secret_key
  region                    = "us-west-1"
  default_lease_ttl_seconds = 14400
  max_lease_ttl_seconds     = 28800
  path                      = "aws"
  description               = "aws secret backend"

}



resource "vault_mount" "db" {
  path = "mssql"
  type = "database"
}

resource "vault_mount" "kvv2" {
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