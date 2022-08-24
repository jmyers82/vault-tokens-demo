provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
}


provider "vault" {
  address = "https://vault-cluster-public-vault-a02ab7e1.7dfb5d47.z1.hashicorp.cloud:8200"

  token = var.vault_admin_token
}

provider "vault" {
  alias     = "cloud"
  address   = "https://vault-cluster-public-vault-a02ab7e1.7dfb5d47.z1.hashicorp.cloud:8200"
  namespace = "admin/cloud"
  token     = var.vault_admin_token
}