# Azure Module - Main Configuration

# Resource Group
# Uncomment to create resource group and resources
# resource "azurerm_resource_group" "main" {
#   name     = var.resource_group_name
#   location = var.location
#   tags     = var.tags
# }

# Virtual Network Configuration
# resource "azurerm_virtual_network" "main" {
#   name                = "${var.project_name}-${var.environment}-vnet"
#   address_space       = [var.vnet_cidr]
#   location            = azurerm_resource_group.main.location
#   resource_group_name = azurerm_resource_group.main.name
#   tags                = var.tags
# }

# Subnets
# resource "azurerm_subnet" "main" {
#   count                = length(var.subnet_cidrs)
#   name                 = "${var.project_name}-${var.environment}-subnet-${count.index + 1}"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = [var.subnet_cidrs[count.index]]
#   
#   # Enable service endpoints if needed
#   # service_endpoints = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.KeyVault"]
# }

# Network Security Groups
# resource "azurerm_network_security_group" "main" {
#   count               = length(var.subnet_cidrs)
#   name                = "${var.project_name}-${var.environment}-nsg-${count.index + 1}"
#   location            = azurerm_resource_group.main.location
#   resource_group_name = azurerm_resource_group.main.name
#   tags                = var.tags
# }

# Default NSG Rules
# resource "azurerm_network_security_rule" "allow_internal" {
#   count                       = length(var.subnet_cidrs)
#   name                        = "AllowVnetInBound"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "VirtualNetwork"
#   resource_group_name         = azurerm_resource_group.main.name
#   network_security_group_name = azurerm_network_security_group.main[count.index].name
# }

# resource "azurerm_network_security_rule" "allow_load_balancer" {
#   count                       = length(var.subnet_cidrs)
#   name                        = "AllowAzureLoadBalancerInBound"
#   priority                    = 110
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "AzureLoadBalancer"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.main.name
#   network_security_group_name = azurerm_network_security_group.main[count.index].name
# }

# resource "azurerm_network_security_rule" "deny_all_inbound" {
#   count                       = length(var.subnet_cidrs)
#   name                        = "DenyAllInBound"
#   priority                    = 4096
#   direction                   = "Inbound"
#   access                      = "Deny"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.main.name
#   network_security_group_name = azurerm_network_security_group.main[count.index].name
# }

# Associate NSGs with Subnets
# resource "azurerm_subnet_network_security_group_association" "main" {
#   count                     = length(var.subnet_cidrs)
#   subnet_id                 = azurerm_subnet.main[count.index].id
#   network_security_group_id = azurerm_network_security_group.main[count.index].id
# }

# NAT Gateway (for outbound connectivity)
# resource "azurerm_public_ip" "nat" {
#   count               = var.enable_nat_gateway ? 1 : 0
#   name                = "${var.project_name}-${var.environment}-nat-pip"
#   location            = azurerm_resource_group.main.location
#   resource_group_name = azurerm_resource_group.main.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   tags                = var.tags
# }

# resource "azurerm_nat_gateway" "main" {
#   count               = var.enable_nat_gateway ? 1 : 0
#   name                = "${var.project_name}-${var.environment}-nat-gateway"
#   location            = azurerm_resource_group.main.location
#   resource_group_name = azurerm_resource_group.main.name
#   sku_name            = "Standard"
#   tags                = var.tags
# }

# resource "azurerm_nat_gateway_public_ip_association" "main" {
#   count                = var.enable_nat_gateway ? 1 : 0
#   nat_gateway_id       = azurerm_nat_gateway.main[0].id
#   public_ip_address_id = azurerm_public_ip.nat[0].id
# }

# Storage Account Configuration
# Uncomment to create storage account and container
# resource "azurerm_storage_account" "main" {
#   count                    = var.enable_storage ? 1 : 0
#   name                     = var.storage_account_name != "" ? var.storage_account_name : lower(replace("${var.project_name}${var.environment}sa", "-", ""))
#   resource_group_name      = azurerm_resource_group.main.name
#   location                 = azurerm_resource_group.main.location
#   account_tier             = "Standard"
#   account_replication_type = var.environment == "prod" ? "GRS" : "LRS"
#   
#   blob_properties {
#     versioning_enabled = true
#     
#     delete_retention_policy {
#       days = 7
#     }
#     
#     container_delete_retention_policy {
#       days = 7
#     }
#   }
#   
#   network_rules {
#     default_action             = "Allow"
#     bypass                     = ["AzureServices"]
#     virtual_network_subnet_ids = azurerm_subnet.main[*].id
#   }
#   
#   tags = var.tags
# }

# resource "azurerm_storage_container" "main" {
#   count                 = var.enable_storage ? 1 : 0
#   name                  = "${var.project_name}-${var.environment}-container"
#   storage_account_name  = azurerm_storage_account.main[0].name
#   container_access_type = "private"
# }

# TODO: Add more Azure resources
# - Azure Bastion
# - Azure Firewall
# - Application Gateway
# - Load Balancer
# - Virtual Machine Scale Sets
# - Azure SQL Database
# - Azure Cache for Redis
# - Azure Functions
# - API Management
# - Key Vault
# - Log Analytics Workspace
# - Application Insights
# - Azure Monitor Alerts