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
  source     = "./network"
  project_id = var.project_id
  region     = var.region
}

module "bastion" {
  source          = "./bastion"
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
  network_name    = module.vpc.network.name
  subnetwork_name = module.vpc.subnet.name
}

module "gke" {
  source                   = "./gke-cluster"
  project_id               = var.project_id
  region                   = var.region
  zone                     = var.zone
  network_name             = module.vpc.network.name
  subnetwork_name          = module.vpc.subnet.name
  master_ipv4_cidr_block   = "10.10.100.0/28"
  cluster_ipv4_cidr_block  = "10.10.110.0/24"
  services_ipv4_cidr_block = "10.10.120.0/24"
  service_account          = var.service_account
}

module "bucket" {
  source = "./storage"
  region = var.region
}

module "database" {
  source     = "./database"
  project_id = var.project_id
  region     = var.region
}