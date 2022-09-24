resource "vault_database_secret_backend_connection" "postgres" {
  backend       = vault_mount.db.path
  name          = "hashisql"
#   allowed_roles = ["dev", "prod"]

  mssql {
    connection_url = "sqlserver://sqladmin:${var.sqladminpwd}@hashi-sqlserver.database.windows.net:1433/hashi-credtest"
    username = "sqladmin"
    password = var.sqladminpwd
    contained_db = true

  }
}