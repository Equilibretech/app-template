# GCP Module Variables

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_regions" {
  description = "List of regions for creating subnets"
  type        = list(string)
}

variable "enable_cloud_nat" {
  description = "Enable Cloud NAT"
  type        = bool
  default     = true
}

variable "enable_storage" {
  description = "Enable Cloud Storage bucket creation"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Cloud Storage bucket name (optional, will be generated if not provided)"
  type        = string
  default     = ""
}

variable "labels" {
  description = "Labels to apply to all resources"
  type        = map(string)
  default     = {}
}

# TODO: Add more GCP-specific variables
# variable "enable_private_google_access" {
#   description = "Enable Private Google Access for subnets"
#   type        = bool
#   default     = true
# }

# variable "enable_flow_logs" {
#   description = "Enable VPC Flow Logs"
#   type        = bool
#   default     = false
# }

# variable "flow_logs_sampling_rate" {
#   description = "VPC Flow Logs sampling rate (0.0 to 1.0)"
#   type        = number
#   default     = 0.5
# }

# variable "enable_cloud_armor" {
#   description = "Enable Cloud Armor security policies"
#   type        = bool
#   default     = false
# }

# variable "allowed_ip_ranges" {
#   description = "List of allowed IP ranges for firewall rules"
#   type        = list(string)
#   default     = ["0.0.0.0/0"]
# }