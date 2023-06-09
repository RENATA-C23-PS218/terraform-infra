terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.64.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "vpc" {
  source = "./network"
  region = var.region
}

module "gke" {
  project_id               = var.project_id
  source                   = "./gke-cluster"
  zone                     = var.zone
  node_zone                = var.cluster_node_zone
  network_name             = module.vpc.network.name
  subnetwork_name          = module.vpc.subnet.name
  cluster_ipv4_cidr_block  = "10.101.0.0/20"
  services_ipv4_cidr_block = "10.102.0.0/20"
}

module "bucket" {
  source     = "./storage"
  project_id = var.project_id
  region     = var.region
}

module "database" {
  source                     = "./database"
  region                     = var.region
  network                    = module.vpc.network.id
  network_private_connection = module.vpc.private_ip_connection.id
}

module "artifact-registry" {
  source = "./artifact-registry"
  region = var.region
}
