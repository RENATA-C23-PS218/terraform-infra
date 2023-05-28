resource "google_sql_database" "renata-dev-db" {
  instance = google_sql_database_instance.renata-dev.name
  name     = var.db_name
}

resource "google_sql_database_instance" "renata-dev" {
  name             = var.instance_name
  region           = var.region
  database_version = "POSTGRES_14"
  depends_on       = var.network_private_connection
  settings {
    tier = "db-custom-2-7680"
    ip_configuration {
      ipv4_enabled    = true
      private_network = var.network
    }
  }

  deletion_protection = "true"
}