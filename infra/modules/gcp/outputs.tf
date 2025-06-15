# GCP Module Outputs

# VPC Outputs
# output "vpc_name" {
#   description = "Name of the VPC"
#   value       = try(google_compute_network.main.name, null)
# }

# output "vpc_id" {
#   description = "ID of the VPC"
#   value       = try(google_compute_network.main.id, null)
# }

# output "vpc_self_link" {
#   description = "Self link of the VPC"
#   value       = try(google_compute_network.main.self_link, null)
# }

# Subnet Outputs
# output "subnet_ids" {
#   description = "IDs of the subnets"
#   value       = try(google_compute_subnetwork.main[*].id, [])
# }

# output "subnet_names" {
#   description = "Names of the subnets"
#   value       = try(google_compute_subnetwork.main[*].name, [])
# }

# output "subnet_self_links" {
#   description = "Self links of the subnets"
#   value       = try(google_compute_subnetwork.main[*].self_link, [])
# }

# output "subnet_ip_ranges" {
#   description = "IP CIDR ranges of the subnets"
#   value       = try(google_compute_subnetwork.main[*].ip_cidr_range, [])
# }

# output "subnet_regions" {
#   description = "Regions of the subnets"
#   value       = try(google_compute_subnetwork.main[*].region, [])
# }

# NAT Outputs
# output "nat_router_names" {
#   description = "Names of the Cloud Routers"
#   value       = try(google_compute_router.main[*].name, [])
# }

# output "nat_names" {
#   description = "Names of the Cloud NAT gateways"
#   value       = try(google_compute_router_nat.main[*].name, [])
# }

# Storage Bucket Outputs
# output "bucket_name" {
#   description = "Name of the Cloud Storage bucket"
#   value       = try(google_storage_bucket.main[0].name, null)
# }

# output "bucket_url" {
#   description = "URL of the Cloud Storage bucket"
#   value       = try(google_storage_bucket.main[0].url, null)
# }

# output "bucket_self_link" {
#   description = "Self link of the Cloud Storage bucket"
#   value       = try(google_storage_bucket.main[0].self_link, null)
# }

# output "bucket_location" {
#   description = "Location of the Cloud Storage bucket"
#   value       = try(google_storage_bucket.main[0].location, null)
# }

# Firewall Outputs
# output "firewall_rule_names" {
#   description = "Names of the firewall rules"
#   value = [
#     try(google_compute_firewall.allow_internal.name, null),
#     try(google_compute_firewall.allow_ssh.name, null),
#     try(google_compute_firewall.allow_http_https.name, null)
#   ]
# }

# TODO: Add more outputs as resources are added
# - Service Account emails
# - Load Balancer IPs
# - Cloud SQL connection names
# - Cloud Function URLs
# - Cloud Run service URLs
# - KMS key IDs