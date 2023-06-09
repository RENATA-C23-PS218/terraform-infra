resource "google_service_account" "bastion-sa" {
  account_id   = var.sa_name
  display_name = "GKE Bastion Service Account"
}

resource "google_project_iam_binding" "bastion-sa-roles" {
  project  = var.project_id
  for_each = toset(var.roles_sa_bastion)
  role     = each.value
  members  = [
    "serviceAccount:${google_service_account.bastion-sa.email}"
  ]
}

resource "google_compute_firewall" "bastion-fw-allow-ssh" {
  name          = var.fw_name
  network       = var.network_name
  direction     = "INGRESS"
  project       = var.project_id
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["bastion"]
}

resource "google_compute_address" "bastion-ip" {
  project      = var.project_id
  name         = var.ip_name
  address_type = "INTERNAL"
  region       = var.region
  subnetwork   = var.subnetwork_name
  address      = "10.10.0.2"
  description  = "Bastion IP Address"
}

resource "google_compute_instance" "bastion-vm" {
  machine_type              = "e2-micro"
  name                      = var.vm_name
  zone                      = var.zone
  project                   = var.project_id
  tags                      = ["bastion"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnetwork_name
    network_ip = google_compute_address.bastion-ip.address
  }

  service_account {
    email  = google_service_account.bastion-sa.email
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}