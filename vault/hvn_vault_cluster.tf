resource "hcp_hvn" "hashiconf_hvn" {
  hvn_id         = "hashiconf22hvn"
  cloud_provider = "aws"
  region         = "us-west-2"
  cidr_block     = "172.25.16.0/20"
}

## terraform import hcp_hvn.hashiconf_hvn hashiconf22hvn

resource "hcp_vault_cluster" "hashiconf22" {
  cluster_id      = "vault-cluster"
  hvn_id          = hcp_hvn.hashiconf_hvn.hvn_id
  tier            = "dev"
  public_endpoint = true

  lifecycle {
    prevent_destroy = true
  }
}



##terraform import hcp_vault_cluster.hashiconf22 vault-cluster