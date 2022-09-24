locals {
  map_environment = {
    "env_type" = "dev"
    "location" = "westus"
    "app_name" = "hashiconf-az-demo" #uses hyphens if needed
  }

  map_resource_group = {
    "location" = "westus"
  }

  map_storage_account = {
    "location"                  = "westus"
    "replication_type"          = "LRS"
    "min_tls_version"           = "TLS1_2"
    "allow_blob_public_access"  = false
    "enable_https_traffic_only" = true
    "access_tier"               = "Hot"
    "account_tier"              = "Standard"
  }

  map_tags = {
    "applicationname" = "az-demo"
    "sector"          = "hashicorp"
    "business"        = "conf"
    "costcenter"      = "0123456"
    "project"         = "azdemo"
    "drtier"          = "tier5"
    "primarycontact"  = "jeremy myers" # could be a distro or app sme or tech app owner
    "environment"     = "dev"
  }
}