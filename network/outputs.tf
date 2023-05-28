output "network" {
  value       = google_compute_network.vpc
  description = "The network"
}

output "subnet" {
  value       = google_compute_subnetwork.vpc-subnet
  description = "The subnet"
}

output "private_ip_connection" {
  value       = google_service_networking_connection.private_vpc_connection
  description = "The private IP"
}