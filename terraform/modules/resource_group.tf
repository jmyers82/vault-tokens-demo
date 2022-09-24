resource "azurerm_resource_group" "hashi_terraform_demo" {
  # name     = "rg-${var.map_environment.app_name}-${var.map_environment.env_type}"
  name     = "rg-${var.map_environment.app_name}"
  location = var.map_resource_group.location
  tags     = var.map_tags
}