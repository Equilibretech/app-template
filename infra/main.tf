terraform {
  required_version = ">= 1.0"
  
  required_providers {
    # Uncomment the provider(s) you want to use
    
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 5.0"
    # }
    
    # google = {
    #   source  = "hashicorp/google"
    #   version = "~> 5.0"
    # }
    
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "~> 3.0"
    # }
  }
  
  # TODO: Configure backend for state management
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "app-template/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

# Provider configurations
# Uncomment and configure the provider(s) you want to use

# provider "aws" {
#   region = var.aws_region
#   
#   default_tags {
#     tags = var.common_tags
#   }
# }

# provider "google" {
#   project = var.gcp_project_id
#   region  = var.gcp_region
# }

# provider "azurerm" {
#   features {}
#   subscription_id = var.azure_subscription_id
# }

# Module configurations
# Uncomment the module(s) for your chosen cloud provider

# AWS Module
# module "aws_infrastructure" {
#   source = "./modules/aws"
#   
#   environment     = var.environment
#   project_name    = var.project_name
#   vpc_cidr        = var.vpc_cidr
#   azs             = var.availability_zones
#   private_subnets = var.private_subnet_cidrs
#   public_subnets  = var.public_subnet_cidrs
#   
#   # TODO: Add more AWS-specific variables
#   # enable_nat_gateway = var.enable_nat_gateway
#   # enable_vpn_gateway = var.enable_vpn_gateway
#   
#   tags = var.common_tags
# }

# GCP Module
# module "gcp_infrastructure" {
#   source = "./modules/gcp"
#   
#   environment    = var.environment
#   project_name   = var.project_name
#   project_id     = var.gcp_project_id
#   region         = var.gcp_region
#   vpc_cidr       = var.vpc_cidr
#   subnet_regions = var.gcp_subnet_regions
#   
#   # TODO: Add more GCP-specific variables
#   # enable_cloud_nat = var.enable_cloud_nat
#   # enable_private_google_access = var.enable_private_google_access
#   
#   labels = var.common_tags
# }

# Azure Module
# module "azure_infrastructure" {
#   source = "./modules/azure"
#   
#   environment          = var.environment
#   project_name         = var.project_name
#   resource_group_name  = var.azure_resource_group_name
#   location             = var.azure_location
#   vnet_cidr            = var.vpc_cidr
#   subnet_cidrs         = var.azure_subnet_cidrs
#   
#   # TODO: Add more Azure-specific variables
#   # enable_bastion = var.enable_bastion
#   # enable_firewall = var.enable_firewall
#   
#   tags = var.common_tags
# }

# TODO: Add shared resources that work across all clouds
# Examples:
# - DNS configuration
# - Monitoring and logging
# - IAM policies
# - Security groups/firewall rules