terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "hashiconf22"
    workspaces {
      name = "hashiconf-azure-demo-dev"
    }
  }
}