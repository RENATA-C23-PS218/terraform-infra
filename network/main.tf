resource "google_compute_network" "vpc" {
  name                            = var.network_name
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "vpc-subnet" {
  ip_cidr_range            = "10.10.0.0/16"
  name                     = var.subnet_name
  region                   = var.region
  network                  = google_compute_network.vpc.name
  private_ip_google_access = true
}

resource "google_compute_global_address" "private_ip_block" {
  name          = var.private_ip_block_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  ip_version    = "IPV4"
  prefix_length = 28
  network       = google_compute_network.vpc.self_link
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
}

resource "google_compute_route" "vpc-egress" {
  dest_range       = "0.0.0.0/0"
  name             = var.egress_name
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_router" "vpc-router" {
  name    = var.router_name
  network = google_compute_network.vpc.name
  region  = google_compute_subnetwork.vpc-subnet.region
}

resource "google_compute_router_nat" "vpc-nat" {
  name                               = var.nat_name
  nat_ip_allocate_option             = "AUTO_ONLY"
  router                             = google_compute_router.vpc-router.name
  region                             = google_compute_subnetwork.vpc-subnet.region
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.vpc-subnet.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}