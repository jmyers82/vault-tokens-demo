module "terraform-demo" {
  source = "../modules"

  map_environment     = local.map_environment
  map_resource_group  = local.map_resource_group
  map_storage_account = local.map_storage_account
  map_tags            = local.map_tags
}

