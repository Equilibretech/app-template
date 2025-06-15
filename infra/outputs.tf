# AWS Outputs
# Uncomment when using AWS module
# output "aws_vpc_id" {
#   description = "ID of the AWS VPC"
#   value       = try(module.aws_infrastructure.vpc_id, null)
# }

# output "aws_private_subnet_ids" {
#   description = "IDs of AWS private subnets"
#   value       = try(module.aws_infrastructure.private_subnet_ids, [])
# }

# output "aws_public_subnet_ids" {
#   description = "IDs of AWS public subnets"
#   value       = try(module.aws_infrastructure.public_subnet_ids, [])
# }

# output "aws_bucket_name" {
#   description = "Name of the AWS S3 bucket"
#   value       = try(module.aws_infrastructure.bucket_name, null)
# }

# output "aws_bucket_arn" {
#   description = "ARN of the AWS S3 bucket"
#   value       = try(module.aws_infrastructure.bucket_arn, null)
# }

# TODO: Add more AWS outputs
# - NAT Gateway IPs
# - VPN Gateway ID
# - Security Group IDs
# - IAM Role ARNs

# GCP Outputs
# Uncomment when using GCP module
# output "gcp_vpc_name" {
#   description = "Name of the GCP VPC"
#   value       = try(module.gcp_infrastructure.vpc_name, null)
# }

# output "gcp_vpc_id" {
#   description = "ID of the GCP VPC"
#   value       = try(module.gcp_infrastructure.vpc_id, null)
# }

# output "gcp_subnet_ids" {
#   description = "IDs of GCP subnets"
#   value       = try(module.gcp_infrastructure.subnet_ids, [])
# }

# output "gcp_bucket_name" {
#   description = "Name of the GCP storage bucket"
#   value       = try(module.gcp_infrastructure.bucket_name, null)
# }

# output "gcp_bucket_url" {
#   description = "URL of the GCP storage bucket"
#   value       = try(module.gcp_infrastructure.bucket_url, null)
# }

# TODO: Add more GCP outputs
# - Cloud NAT IPs
# - Firewall Rule IDs
# - Service Account emails
# - Cloud Router IDs

# Azure Outputs
# Uncomment when using Azure module
# output "azure_resource_group_name" {
#   description = "Name of the Azure resource group"
#   value       = try(module.azure_infrastructure.resource_group_name, null)
# }

# output "azure_vnet_id" {
#   description = "ID of the Azure VNet"
#   value       = try(module.azure_infrastructure.vnet_id, null)
# }

# output "azure_subnet_ids" {
#   description = "IDs of Azure subnets"
#   value       = try(module.azure_infrastructure.subnet_ids, [])
# }

# output "azure_storage_account_name" {
#   description = "Name of the Azure storage account"
#   value       = try(module.azure_infrastructure.storage_account_name, null)
# }

# output "azure_container_name" {
#   description = "Name of the Azure storage container"
#   value       = try(module.azure_infrastructure.container_name, null)
# }

# TODO: Add more Azure outputs
# - Network Security Group IDs
# - Public IP addresses
# - Load Balancer IPs
# - Key Vault URIs

# Common Outputs
output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "project_name" {
  description = "Project name"
  value       = var.project_name
}

# TODO: Add cross-cloud outputs
# - DNS records
# - Monitoring dashboard URLs
# - Log aggregation endpoints
# - API Gateway URLs