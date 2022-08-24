# resource "vault_aws_secret_backend" "aws" {
#   access_key = "AKIA....."
#   secret_key = "AWS secret key"
# }

# resource "vault_azure_secret_backend" "azure" {
#   use_microsoft_graph_api = true
#   subscription_id         = "d995a747-3f1a-412a-bf34-655f5d44cc0f"
#   tenant_id               = "46eb567a-7cf3-48cc-9a90-f6deab9bb040"
#   client_id               = "df8d18ab-3c48-4697-9884-65ee95ed4ae6"
#   client_secret           = "${var.azure_client_secret}"
#   environment             = "AzurePublicCloud"
# }