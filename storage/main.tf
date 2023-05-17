resource "google_storage_bucket" "renata-dev-bucket" {
  location                    = var.region
  name                        = var.bucket_name
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = false
  public_access_prevention    = "inherited"
}

resource "google_storage_bucket_access_control" "renata-dev-bucket-acl" {
  bucket = google_storage_bucket.renata-dev-bucket.name
  entity = "allUsers"
  role   = "READER"
}

resource "google_storage_bucket" "renata-dev-tf-state" {
  location                    = var.region
  name                        = var.tf_state_bucket_name
  storage_class               = "STANDARD"
  force_destroy               = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  autoclass {
    enabled = true
  }
  versioning {
    enabled = true
  }
}