resource "google_sql_database" "renata-dev-db" {
  instance = google_sql_database_instance.renata-dev.name
  name     = var.db_name
}

resource "google_sql_database_instance" "renata-dev" {
  name             = var.instance_name
  region           = var.region
  database_version = "POSTGRES_14"
  settings {
    tier = "db-custom-2-7680"
  }

  deletion_protection = "true"
}