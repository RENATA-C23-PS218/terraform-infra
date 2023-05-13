resource "google_storage_bucket" "renata-dev-bucket" {
  location                    = var.region
  name                        = var.bucket_name
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}

resource "google_storage_bucket_access_control" "renata-dev-bucket-acl" {
  bucket = google_storage_bucket.renata-dev-bucket.name
  entity = "allAuthenticatedUsers"
  role   = "READER"
}