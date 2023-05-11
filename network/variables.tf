variable "network_name" {
  type        = string
  description = "The name of the network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "egress_name" {
  type        = string
  description = "The name of the egress"
}

variable "router_name" {
  type        = string
  description = "The name of the router"
}

variable "nat_name" {
  type        = string
  description = "The name of nat"
}

variable "region" {
  type        = string
  description = "The region of the network"
}