terraform {
  cloud {
    organization = "hashiconf22"
    hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "vault-setup"
    }
  }
}