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