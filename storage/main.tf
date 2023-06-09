#resource "google_storage_bucket" "renata-dev-bucket-profile" {
#  location                    = var.region
#  name                        = var.bucket_name_profile
#  storage_class               = "STANDARD"
#  force_destroy               = true
#  uniform_bucket_level_access = true
#}

resource "google_storage_bucket" "renata-dev-bucket-soil" {
  location                    = var.region
  name                        = var.bucket_name_soil
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true
}

#resource "google_storage_bucket_iam_member" "public-access" {
#  bucket = google_storage_bucket.renata-dev-bucket-profile.name
#  member = "allUsers"
#  role   = "roles/storage.objectViewer"
#}

resource "google_storage_bucket_iam_member" "public-access" {
  bucket = google_storage_bucket.renata-dev-bucket-soil.name
  member = "allUsers"
  role   = "roles/storage.objectViewer"
}

resource "google_storage_bucket" "renata-dev-tf-state" {
  location                    = var.region
  name                        = var.tf_state_bucket_name
  storage_class               = "STANDARD"
  force_destroy               = false
  uniform_bucket_level_access = true
  autoclass {
    enabled = true
  }
  versioning {
    enabled = true
  }
}