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

module "bastion" {
  source          = "./bastion"
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
  network_name    = module.vpc.network.name
  subnetwork_name = module.vpc.subnet.name
}

module "gke" {
  project_id                            = var.project_id
  source                                = "./gke-cluster"
  zone                                  = var.zone
  node_zone                             = var.cluster_node_zone
  network_name                          = module.vpc.network.name
  subnetwork_name                       = module.vpc.subnet.name
  master_ipv4_cidr_block                = "10.100.100.0/28"
  cluster_ipv4_cidr_block               = "10.101.0.0/20"
  services_ipv4_cidr_block              = "10.102.0.0/20"
  master_authorized_networks_cidr_block = "10.10.0.0/32"
}

module "bucket" {
  source = "./storage"
  region = var.region
}

module "database" {
  source = "./database"
  region = var.region
}

module "artifact-registry" {
  source = "./artifact-registry"
  region = var.region
}
