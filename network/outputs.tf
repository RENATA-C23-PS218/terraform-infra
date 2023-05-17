output "network" {
  value       = google_compute_network.vpc
  description = "The network"
}

output "subnet" {
  value       = google_compute_subnetwork.vpc-subnet
  description = "The subnet"
}