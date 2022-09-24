#######################################################
### THIS MODULE IS OWNED BY THE CLOUD PLATFORM TEAM ###
#######################################################
module "vaultprovider" {
  source          = "app.terraform.io/wy-eoda/vaultprovider/azurerm"
  version         = "~>v1.0"
  vault_token     = var.vault_token
  subscription_id = var.subscription_id
  validate_creds  = true
}


provider "azurerm" {
  features {}
  # skip_provider_registration = false
  client_id       = module.vaultprovider.client_id
  client_secret   = module.vaultprovider.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}



## do not update / change these as they are pulled from the workspace variables. 
variable "subscription_id" {}
variable "tenant_id" {}
variable "vault_token" {}