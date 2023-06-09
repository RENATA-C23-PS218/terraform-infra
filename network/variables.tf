variable "network_name" {
  type        = string
  description = "The name of the network"
  default     = "vpc-renata"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "vpc-renata-subnet"
}

variable "egress_name" {
  type        = string
  description = "The name of the egress"
  default     = "vpc-renata-egress"
}

variable "router_name" {
  type        = string
  description = "The name of the router"
  default     = "vpc-renata-router"
}

variable "nat_name" {
  type        = string
  description = "The name of nat"
  default     = "vpc-renata-nat"
}

variable "region" {
  type        = string
  description = "The region of the network"
}

variable "private_ip_block_name" {
  type        = string
  description = "The name of the private ip block"
  default     = "vpc-renata-private-ip-block"
}