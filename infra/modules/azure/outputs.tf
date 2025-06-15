# Azure Module Outputs

# Resource Group Outputs
# output "resource_group_name" {
#   description = "Name of the resource group"
#   value       = try(azurerm_resource_group.main.name, null)
# }

# output "resource_group_id" {
#   description = "ID of the resource group"
#   value       = try(azurerm_resource_group.main.id, null)
# }

# output "resource_group_location" {
#   description = "Location of the resource group"
#   value       = try(azurerm_resource_group.main.location, null)
# }

# VNet Outputs
# output "vnet_id" {
#   description = "ID of the Virtual Network"
#   value       = try(azurerm_virtual_network.main.id, null)
# }

# output "vnet_name" {
#   description = "Name of the Virtual Network"
#   value       = try(azurerm_virtual_network.main.name, null)
# }

# output "vnet_address_space" {
#   description = "Address space of the Virtual Network"
#   value       = try(azurerm_virtual_network.main.address_space, [])
# }

# Subnet Outputs
# output "subnet_ids" {
#   description = "IDs of the subnets"
#   value       = try(azurerm_subnet.main[*].id, [])
# }

# output "subnet_names" {
#   description = "Names of the subnets"
#   value       = try(azurerm_subnet.main[*].name, [])
# }

# output "subnet_address_prefixes" {
#   description = "Address prefixes of the subnets"
#   value       = try(azurerm_subnet.main[*].address_prefixes, [])
# }

# NSG Outputs
# output "nsg_ids" {
#   description = "IDs of the Network Security Groups"
#   value       = try(azurerm_network_security_group.main[*].id, [])
# }

# output "nsg_names" {
#   description = "Names of the Network Security Groups"
#   value       = try(azurerm_network_security_group.main[*].name, [])
# }

# NAT Gateway Outputs
# output "nat_gateway_id" {
#   description = "ID of the NAT Gateway"
#   value       = try(azurerm_nat_gateway.main[0].id, null)
# }

# output "nat_public_ip" {
#   description = "Public IP address of the NAT Gateway"
#   value       = try(azurerm_public_ip.nat[0].ip_address, null)
# }

# Storage Account Outputs
# output "storage_account_name" {
#   description = "Name of the storage account"
#   value       = try(azurerm_storage_account.main[0].name, null)
# }

# output "storage_account_id" {
#   description = "ID of the storage account"
#   value       = try(azurerm_storage_account.main[0].id, null)
# }

# output "storage_account_primary_endpoint" {
#   description = "Primary blob endpoint of the storage account"
#   value       = try(azurerm_storage_account.main[0].primary_blob_endpoint, null)
# }

# output "container_name" {
#   description = "Name of the storage container"
#   value       = try(azurerm_storage_container.main[0].name, null)
# }

# TODO: Add more outputs as resources are added
# - Bastion host FQDN
# - Firewall public IP
# - Load Balancer frontend IPs
# - Key Vault URI
# - Log Analytics Workspace ID
# - Application Insights instrumentation key