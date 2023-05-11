variable "region" {
  type        = string
  description = "The region to use"
}

variable "gke_name" {
  type        = string
  description = "The name of the GKE cluster"
}

variable "gke_node_pool_name" {
  type        = string
  description = "The name of the GKE node pool"
}

variable "network_name" {
  type        = string
  description = "The name of the network"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "service_account" {
  type        = string
  description = "The service account to use"
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
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "The /28 CIDR block to use for the master IPs"
}