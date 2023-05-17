resource "google_artifact_registry_repository" "renata-dev-repo" {
  location      = module.vpc.region
  repository_id = var.repository_id 
  region        = var.region
  description   = "This is the artifact registry for Backend API service"
  format        = "DOCKER"
  docker_config {
    immutable_tags = true
  }
}
