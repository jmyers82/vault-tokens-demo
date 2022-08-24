resource "vault_aws_secret_backend" "aws" {
  provider                  = vault.cloud
  access_key                = "AKIATJPOA3YCMVBUMEPW"
  secret_key                = "AWS secret key"
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