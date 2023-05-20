variable "zone" {
  type        = string
  description = "The zone to use"
}

variable "node_zone" {
  type        = list(string)
  description = "The node zone to use"
}

variable "gke_name" {
  type        = string
  description = "The name of the GKE cluster"
  default     = "renata-dev-cluster"
}

variable "gke_node_pool_name" {
  type        = string
  description = "The name of the GKE node pool"
  default     = "renata-dev-node-pool"
}

variable "network_name" {
  type        = string
  description = "The name of the network"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "sa_name" {
  type        = string
  description = "The service account to use"
  default     = "renata-dev-gke-sa"
}

variable "cicd_name" {
  type        = string
  description = "The service account to use"
  default     = "renata-dev-cicd-sa"
}

variable "cluster_ipv4_cidr_block" {
  type        = string
  description = "The CIDR block to use for pod IPs"
}

variable "services_ipv4_cidr_block" {
  type        = string
  description = "The CIDR block to use for the service IPs"
}

variable "master_authorized_networks_cidr_block" {
  type        = string
  description = "The CIDR block where HTTPS access is allowed from"
  default     = null
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "The /28 CIDR block to use for the master IPs"
}

variable "roles_sa_cicd" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = [
    "roles/artifactregistry.writer", "roles/artifactregistry.reader", "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountUser", "roles/container.developer"
  ]
}

variable "roles_sa_gke" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = ["roles/cloudsql.client", "roles/storage.objectCreator", "roles/storage.objectViewer"]
}

variable "project_id" {
  type        = string
  description = "The project ID to use"
}