# AWS Module Variables

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "enable_storage" {
  description = "Enable S3 bucket creation"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "S3 bucket name (optional, will be generated if not provided)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# TODO: Add more AWS-specific variables
# variable "enable_vpc_endpoints" {
#   description = "Enable VPC endpoints for AWS services"
#   type        = bool
#   default     = false
# }

# variable "vpc_endpoint_services" {
#   description = "List of AWS services to create VPC endpoints for"
#   type        = list(string)
#   default     = ["s3", "ec2", "ecr.api", "ecr.dkr"]
# }

# variable "enable_flow_logs" {
#   description = "Enable VPC Flow Logs"
#   type        = bool
#   default     = false
# }

# variable "flow_logs_retention_days" {
#   description = "Number of days to retain flow logs"
#   type        = number
#   default     = 7
# }