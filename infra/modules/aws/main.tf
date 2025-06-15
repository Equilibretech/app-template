# AWS Module - Main Configuration

# VPC Configuration
# Uncomment to create VPC and networking resources
# resource "aws_vpc" "main" {
#   cidr_block           = var.vpc_cidr
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-vpc"
#     }
#   )
# }

# Internet Gateway
# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-igw"
#     }
#   )
# }

# Public Subnets
# resource "aws_subnet" "public" {
#   count                   = length(var.public_subnets)
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.public_subnets[count.index]
#   availability_zone       = var.azs[count.index]
#   map_public_ip_on_launch = true
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
#       Type = "Public"
#     }
#   )
# }

# Private Subnets
# resource "aws_subnet" "private" {
#   count             = length(var.private_subnets)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.private_subnets[count.index]
#   availability_zone = var.azs[count.index]
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-private-subnet-${count.index + 1}"
#       Type = "Private"
#     }
#   )
# }

# Elastic IPs for NAT Gateways
# resource "aws_eip" "nat" {
#   count  = var.enable_nat_gateway ? length(var.azs) : 0
#   domain = "vpc"
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-nat-eip-${count.index + 1}"
#     }
#   )
#   
#   depends_on = [aws_internet_gateway.main]
# }

# NAT Gateways
# resource "aws_nat_gateway" "main" {
#   count         = var.enable_nat_gateway ? length(var.azs) : 0
#   subnet_id     = aws_subnet.public[count.index].id
#   allocation_id = aws_eip.nat[count.index].id
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-nat-gateway-${count.index + 1}"
#     }
#   )
#   
#   depends_on = [aws_internet_gateway.main]
# }

# Route Tables
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id
#   
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main.id
#   }
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-public-rt"
#     }
#   )
# }

# resource "aws_route_table" "private" {
#   count  = length(var.azs)
#   vpc_id = aws_vpc.main.id
#   
#   dynamic "route" {
#     for_each = var.enable_nat_gateway ? [1] : []
#     content {
#       cidr_block     = "0.0.0.0/0"
#       nat_gateway_id = aws_nat_gateway.main[count.index].id
#     }
#   }
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-private-rt-${count.index + 1}"
#     }
#   )
# }

# Route Table Associations
# resource "aws_route_table_association" "public" {
#   count          = length(var.public_subnets)
#   subnet_id      = aws_subnet.public[count.index].id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "private" {
#   count          = length(var.private_subnets)
#   subnet_id      = aws_subnet.private[count.index].id
#   route_table_id = aws_route_table.private[count.index].id
# }

# S3 Bucket Configuration
# Uncomment to create S3 bucket
# resource "aws_s3_bucket" "main" {
#   count  = var.enable_storage ? 1 : 0
#   bucket = var.bucket_name != "" ? var.bucket_name : "${var.project_name}-${var.environment}-${data.aws_caller_identity.current.account_id}"
#   
#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-${var.environment}-bucket"
#     }
#   )
# }

# resource "aws_s3_bucket_versioning" "main" {
#   count  = var.enable_storage ? 1 : 0
#   bucket = aws_s3_bucket.main[0].id
#   
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
#   count  = var.enable_storage ? 1 : 0
#   bucket = aws_s3_bucket.main[0].id
#   
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# resource "aws_s3_bucket_public_access_block" "main" {
#   count  = var.enable_storage ? 1 : 0
#   bucket = aws_s3_bucket.main[0].id
#   
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# Data Sources
# data "aws_caller_identity" "current" {}

# TODO: Add more AWS resources
# - Security Groups
# - VPC Endpoints
# - VPN Gateway
# - Transit Gateway
# - Load Balancers
# - Auto Scaling Groups
# - RDS Instances
# - ElastiCache Clusters
# - Lambda Functions
# - API Gateway
# - CloudWatch Alarms
# - IAM Roles and Policies