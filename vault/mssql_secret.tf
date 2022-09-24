resource "vault_database_secret_backend_connection" "mssql" {
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