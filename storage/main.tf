resource "google_storage_bucket" "renata-bucket-profile" {
  location                    = var.region
  name                        = var.bucket_name_profile
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "renata-bucket-soil" {
  location                    = var.region
  name                        = var.bucket_name_soil
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "public-access" {
  bucket = google_storage_bucket.renata-bucket-profile.name
  member = "allUsers"
  role   = "roles/storage.objectViewer"
}

resource "google_storage_bucket_iam_member" "public-access" {
  bucket = google_storage_bucket.renata-bucket-soil.name
  member = "allUsers"
  role   = "roles/storage.objectViewer"
}

#resource "google_storage_bucket" "renata-tf-state" {
#  location                    = var.region
#  name                        = var.tf_state_bucket_name
#  storage_class               = "STANDARD"
#  force_destroy               = false
#  uniform_bucket_level_access = true
#  autoclass {
#    enabled = true
#  }
#  versioning {
#    enabled = true
#  }
#}

resource "google_service_account" "bucket-sa" {
  account_id   = var.sa_name
  display_name = "Service Account for upload files to GCS"
}

resource "google_project_iam_binding" "bucket-sa-roles" {
  project  = var.project_id
  for_each = toset(var.roles_sa_bucket)
  role     = each.value
  members  = [
    "serviceAccount:${google_service_account.bucket-sa.email}"
  ]
}