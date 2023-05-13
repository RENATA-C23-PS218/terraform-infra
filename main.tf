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
  source       = "./network"
  project_id   = var.project_id
  network_name = "vpc-renata-dev"
  subnet_name  = "vpc-renata-dev-subnet1"
  region       = var.region
  egress_name  = "vpc-renata-dev-egress"
  router_name  = "vpc-renata-dev-router"
  nat_name     = "vpc-renata-dev-nat"
}

module "bastion" {
  source          = "./bastion"
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
  network_name    = module.vpc.network_name
  subnetwork_name = module.vpc.subnet_name
  sa_name         = "renata-dev-bastion-sa"
  fw_name         = "renata-dev-bastion-fw-allow-ssh"
  ip_name         = "renata-dev-bastion-ip"
  vm_name         = "renata-dev-bastion-vm"
}

module "gke" {
  source                                = "./gke-cluster"
  project_id                            = var.project_id
  region                                = var.region
  zone                                  = var.zone
  network_name                          = module.vpc.network_name
  subnetwork_name                       = module.vpc.subnet_name
  gke_name                              = "renata-dev-cluster"
  gke_node_pool_name                    = "renata-dev-node-pool"
  master_ipv4_cidr_block                = "10.10.100.0/28"
  cluster_ipv4_cidr_block               = "10.10.110.0/24"
  services_ipv4_cidr_block              = "10.10.120.0/24"
  master_authorized_networks_cidr_block = null
  service_account                       = "renata-dev-gke-sa"
}

module "bucket" {
  source      = "./storage"
  region      = "ASIA"
  bucket_name = "renata-dev-bucket"
}

module "database" {
  source        = "./database"
  project_id    = var.project_id
  region        = var.region
  db_name       = "renata-dev-db"
  instance_name = "renata-dev"
}