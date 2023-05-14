variable "sa_name" {
  type        = string
  description = "The name of the service account"
  default     = "renata-dev-bastion-sa"
}

variable "fw_name" {
  type        = string
  description = "The name of the firewall rule"
  default     = "renata-dev-bastion-fw-allow-ssh"
}

variable "network_name" {
  type        = string
  description = "The name of the network"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "project_id" {
  type        = string
  description = "The project ID"
}

variable "region" {
  type        = string
  description = "The region"
}

variable "zone" {
  type        = string
  description = "The zone"
}

variable "ip_name" {
  type        = string
  description = "The name of the IP"
  default     = "renata-dev-bastion-ip"
}

variable "vm_name" {
  type        = string
  description = "The name of the VM"
  default     = "renata-dev-bastion-vm"
}