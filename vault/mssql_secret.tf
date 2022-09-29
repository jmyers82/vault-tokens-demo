resource "vault_mount" "db" {
  provider    = vault.cloud
  path = "mssql"
  type = "database"
}


resource "vault_database_secret_backend_connection" "mssql" {
  provider    = vault.cloud
  backend       = vault_mount.db.path
  name          = "hashisql"
#   allowed_roles = ["dev", "prod"]

  mssql {
    connection_url = "sqlserver://{{username}}:{{password}}@hashi-sqlserver.database.windows.net:1433"
    username = "sqladmin"
    password = var.sqladminpwd
    contained_db = true

  }
}