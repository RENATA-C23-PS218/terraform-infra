resource "google_service_account" "gke-sa" {
  account_id   = var.sa_name
  display_name = "GKE Service Account"
}

resource "google_service_account" "cicd-sa" {
  account_id   = var.cicd_name
  display_name = "CI/CD Service Account"
}

resource "google_project_iam_binding" "gsa-to-gke-sa" {
  role = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${google_service_account.gke-sa.email}",
  ]
}

resource "kubernetes_service_account" "ksa" {
  name = google_service_account.gke-sa.name
  metadata {
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.gke-sa.email
    }
  }
}

resource "google_project_iam_binding" "gke-sa-roles" {
  project  = var.project_id
  for_each = toset(var.roles_sa_gke)
  role     = each.value
  members  = [
    "serviceAccount:${google_service_account.gke-sa.email}"
  ]
}

resource "google_project_iam_binding" "cicd-sa-roles" {
  project  = var.project_id
  for_each = toset(var.roles_sa_cicd)
  role     = each.value
  members  = [
    "serviceAccount:${google_service_account.cicd-sa.email}"
  ]
}

resource "google_container_cluster" "gke-cluster-dev" {
  name                     = var.gke_name
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  network    = var.network_name
  subnetwork = var.subnetwork_name

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  #  master_authorized_networks_config {
  #    cidr_blocks {
  #      cidr_block   = var.master_authorized_networks_cidr_block
  #      display_name = "External Control Plane Access"
  #    }
  #  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = false
    #  master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
}

resource "google_container_node_pool" "gke-node-pool" {
  cluster        = google_container_cluster.gke-cluster-dev.name
  name           = var.gke_node_pool_name
  location       = google_container_cluster.gke-cluster-dev.location
  node_locations = var.node_zone
  node_count     = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = "n1-standard-1"
    preemptible  = true
    labels       = {
      "env" = "dev"
    }
    service_account = google_service_account.gke-sa.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
