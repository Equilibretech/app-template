# AWS Module Outputs

# VPC Outputs
# output "vpc_id" {
#   description = "ID of the VPC"
#   value       = try(aws_vpc.main.id, null)
# }

# output "vpc_cidr" {
#   description = "CIDR block of the VPC"
#   value       = try(aws_vpc.main.cidr_block, null)
# }

# Subnet Outputs
# output "private_subnet_ids" {
#   description = "IDs of private subnets"
#   value       = try(aws_subnet.private[*].id, [])
# }

# output "public_subnet_ids" {
#   description = "IDs of public subnets"
#   value       = try(aws_subnet.public[*].id, [])
# }

# output "private_subnet_cidrs" {
#   description = "CIDR blocks of private subnets"
#   value       = try(aws_subnet.private[*].cidr_block, [])
# }

# output "public_subnet_cidrs" {
#   description = "CIDR blocks of public subnets"
#   value       = try(aws_subnet.public[*].cidr_block, [])
# }

# NAT Gateway Outputs
# output "nat_gateway_ids" {
#   description = "IDs of NAT Gateways"
#   value       = try(aws_nat_gateway.main[*].id, [])
# }

# output "nat_gateway_public_ips" {
#   description = "Public IPs of NAT Gateways"
#   value       = try(aws_eip.nat[*].public_ip, [])
# }

# S3 Bucket Outputs
# output "bucket_name" {
#   description = "Name of the S3 bucket"
#   value       = try(aws_s3_bucket.main[0].id, null)
# }

# output "bucket_arn" {
#   description = "ARN of the S3 bucket"
#   value       = try(aws_s3_bucket.main[0].arn, null)
# }

# output "bucket_domain_name" {
#   description = "Domain name of the S3 bucket"
#   value       = try(aws_s3_bucket.main[0].bucket_domain_name, null)
# }

# output "bucket_regional_domain_name" {
#   description = "Regional domain name of the S3 bucket"
#   value       = try(aws_s3_bucket.main[0].bucket_regional_domain_name, null)
# }

# TODO: Add more outputs as resources are added
# - Security Group IDs
# - VPC Endpoint IDs
# - Route Table IDs
# - Internet Gateway ID
# - VPN Gateway ID
# - Load Balancer DNS names
# - IAM Role ARNs