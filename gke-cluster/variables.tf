variable "region" {
  type        = string
  description = "The region to use"
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