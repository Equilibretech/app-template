# Azure Module Variables

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region/location"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR block for Virtual Network"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR blocks for subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for outbound connectivity"
  type        = bool
  default     = true
}

variable "enable_storage" {
  description = "Enable Storage Account creation"
  type        = bool
  default     = true
}

variable "storage_account_name" {
  description = "Storage account name (optional, will be generated if not provided)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# TODO: Add more Azure-specific variables
# variable "enable_bastion" {
#   description = "Enable Azure Bastion for secure RDP/SSH"
#   type        = bool
#   default     = false
# }

# variable "enable_firewall" {
#   description = "Enable Azure Firewall"
#   type        = bool
#   default     = false
# }

# variable "enable_ddos_protection" {
#   description = "Enable DDoS Protection Standard"
#   type        = bool
#   default     = false
# }

# variable "enable_private_endpoints" {
#   description = "Enable private endpoints for PaaS services"
#   type        = bool
#   default     = false
# }

# variable "log_analytics_workspace_id" {
#   description = "ID of Log Analytics Workspace for diagnostics"
#   type        = string
#   default     = ""
# }