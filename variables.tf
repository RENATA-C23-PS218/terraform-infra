variable "project_id" {
  type        = string
  description = "Project ID from Google Cloud Console"
}

variable "region" {
  type        = string
  description = "Region to Deploy the Infrastructure"
}

variable "zone" {
  type        = string
  description = "Zone to Deploy the Infrastructure"
}

variable "cluster_node_zone" {
  type        = list(string)
  description = "Zone to Deploy the Kubernetes Cluster"
}