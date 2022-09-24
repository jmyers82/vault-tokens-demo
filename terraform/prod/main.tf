module "terraform-demo" {
  source = "../modules"
  providers = {
    azurerm = azurerm
  }

  map_environment     = local.map_environment
  map_resource_group  = local.map_resource_group
  map_storage_account = local.map_storage_account
  map_tags            = local.map_tags
}


## do not update / change these as they are pulled from the workspace variables. 
variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}