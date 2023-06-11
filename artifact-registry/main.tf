resource "google_artifact_registry_repository" "renata-repo" {
  location      = var.region
  repository_id = var.repository_id
  description   = "This is the artifact registry for Backend API service"
  format        = "DOCKER"
  docker_config {
    immutable_tags = false
  }
}
