variable "network_name" {
  type        = string
  description = "The name of the network"
  default     = "vpn-renata-dev"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "vpn-renata-dev-subnet"
}

variable "egress_name" {
  type        = string
  description = "The name of the egress"
  default     = "vpn-renata-dev-egress"
}

variable "router_name" {
  type        = string
  description = "The name of the router"
  default     = "vpn-renata-dev-router"
}

variable "nat_name" {
  type        = string
  description = "The name of nat"
  default     = "vpn-renata-dev-nat"
}

variable "region" {
  type        = string
  description = "The region of the network"
}