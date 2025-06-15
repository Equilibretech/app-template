# Common Variables
variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "app-template"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "app-template"
    ManagedBy   = "terraform"
  }
}

# Network Configuration
variable "vpc_cidr" {
  description = "CIDR block for VPC/VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

# AWS Variables
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# TODO: Add more AWS-specific variables
# variable "enable_nat_gateway" {
#   description = "Enable NAT Gateway for private subnets"
#   type        = bool
#   default     = true
# }

# variable "enable_vpn_gateway" {
#   description = "Enable VPN Gateway"
#   type        = bool
#   default     = false
# }

# GCP Variables
variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
  default     = ""
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "gcp_subnet_regions" {
  description = "GCP subnet regions"
  type        = list(string)
  default     = ["us-central1", "us-east1", "us-west1"]
}

# TODO: Add more GCP-specific variables
# variable "enable_cloud_nat" {
#   description = "Enable Cloud NAT"
#   type        = bool
#   default     = true
# }

# variable "enable_private_google_access" {
#   description = "Enable Private Google Access"
#   type        = bool
#   default     = true
# }

# Azure Variables
variable "azure_subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = ""
}

variable "azure_resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "rg-app-template"
}

variable "azure_location" {
  description = "Azure region/location"
  type        = string
  default     = "eastus"
}

variable "azure_subnet_cidrs" {
  description = "Azure subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# TODO: Add more Azure-specific variables
# variable "enable_bastion" {
#   description = "Enable Azure Bastion"
#   type        = bool
#   default     = false
# }

# variable "enable_firewall" {
#   description = "Enable Azure Firewall"
#   type        = bool
#   default     = false
# }

# Storage Variables
variable "enable_storage" {
  description = "Enable storage bucket/container creation"
  type        = bool
  default     = true
}

variable "storage_bucket_name" {
  description = "Name for the storage bucket (must be globally unique)"
  type        = string
  default     = ""
}

# TODO: Add more common variables
# - Database configuration
# - Compute instance specifications
# - Load balancer configuration
# - Security settings
# - Monitoring and logging configuration