# GCP Module - Main Configuration

# VPC Configuration
# Uncomment to create VPC and networking resources
# resource "google_compute_network" "main" {
#   name                    = "${var.project_name}-${var.environment}-vpc"
#   auto_create_subnetworks = false
#   project                 = var.project_id
#   description             = "VPC for ${var.project_name} ${var.environment} environment"
# }

# Subnets
# resource "google_compute_subnetwork" "main" {
#   count         = length(var.subnet_regions)
#   name          = "${var.project_name}-${var.environment}-subnet-${var.subnet_regions[count.index]}"
#   ip_cidr_range = cidrsubnet(var.vpc_cidr, 8, count.index)
#   region        = var.subnet_regions[count.index]
#   network       = google_compute_network.main.id
#   project       = var.project_id
#   
#   private_ip_google_access = true
#   
#   log_config {
#     aggregation_interval = "INTERVAL_5_SEC"
#     flow_sampling        = 0.5
#     metadata            = "INCLUDE_ALL_METADATA"
#   }
# }

# Cloud NAT
# resource "google_compute_router" "main" {
#   count   = var.enable_cloud_nat ? length(var.subnet_regions) : 0
#   name    = "${var.project_name}-${var.environment}-router-${var.subnet_regions[count.index]}"
#   region  = var.subnet_regions[count.index]
#   network = google_compute_network.main.id
#   project = var.project_id
#   
#   bgp {
#     asn = 64514
#   }
# }

# resource "google_compute_router_nat" "main" {
#   count                              = var.enable_cloud_nat ? length(var.subnet_regions) : 0
#   name                               = "${var.project_name}-${var.environment}-nat-${var.subnet_regions[count.index]}"
#   router                             = google_compute_router.main[count.index].name
#   region                             = google_compute_router.main[count.index].region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#   project                            = var.project_id
#   
#   log_config {
#     enable = true
#     filter = "ERRORS_ONLY"
#   }
# }

# Firewall Rules
# resource "google_compute_firewall" "allow_internal" {
#   name    = "${var.project_name}-${var.environment}-allow-internal"
#   network = google_compute_network.main.name
#   project = var.project_id
#   
#   allow {
#     protocol = "icmp"
#   }
#   
#   allow {
#     protocol = "tcp"
#     ports    = ["0-65535"]
#   }
#   
#   allow {
#     protocol = "udp"
#     ports    = ["0-65535"]
#   }
#   
#   source_ranges = [var.vpc_cidr]
#   priority      = 1000
# }

# resource "google_compute_firewall" "allow_ssh" {
#   name    = "${var.project_name}-${var.environment}-allow-ssh"
#   network = google_compute_network.main.name
#   project = var.project_id
#   
#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
#   
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["ssh-enabled"]
#   priority      = 1000
# }

# resource "google_compute_firewall" "allow_http_https" {
#   name    = "${var.project_name}-${var.environment}-allow-http-https"
#   network = google_compute_network.main.name
#   project = var.project_id
#   
#   allow {
#     protocol = "tcp"
#     ports    = ["80", "443"]
#   }
#   
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["http-server", "https-server"]
#   priority      = 1000
# }

# Cloud Storage Bucket Configuration
# Uncomment to create storage bucket
# resource "google_storage_bucket" "main" {
#   count    = var.enable_storage ? 1 : 0
#   name     = var.bucket_name != "" ? var.bucket_name : "${var.project_name}-${var.environment}-${var.project_id}"
#   location = var.region
#   project  = var.project_id
#   
#   uniform_bucket_level_access = true
#   force_destroy               = var.environment != "prod"
#   
#   versioning {
#     enabled = true
#   }
#   
#   lifecycle_rule {
#     condition {
#       age = 30
#       matches_storage_class = ["STANDARD"]
#     }
#     action {
#       type          = "SetStorageClass"
#       storage_class = "NEARLINE"
#     }
#   }
#   
#   lifecycle_rule {
#     condition {
#       age = 90
#       matches_storage_class = ["NEARLINE"]
#     }
#     action {
#       type          = "SetStorageClass"
#       storage_class = "COLDLINE"
#     }
#   }
#   
#   labels = var.labels
# }

# resource "google_storage_bucket_iam_binding" "main" {
#   count  = var.enable_storage ? 1 : 0
#   bucket = google_storage_bucket.main[0].name
#   role   = "roles/storage.objectViewer"
#   
#   members = [
#     "projectViewer:${var.project_id}",
#   ]
# }

# TODO: Add more GCP resources
# - Service Accounts
# - Cloud Load Balancing
# - Instance Templates
# - Managed Instance Groups
# - Cloud SQL Instances
# - Cloud Memorystore
# - Cloud Functions
# - Cloud Run Services
# - Cloud Endpoints
# - VPC Service Controls
# - Cloud KMS Keys
# - Monitoring Dashboards