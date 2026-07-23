output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network."
}

output "subnet_ids" {
  # This loops through all created subnets and outputs them as: { "subnet_name" = "subnet_id" }
  value       = { for name, s in azurerm_subnet.subnet : name => s.id }
  description = "A map of subnet names to their IDs."
}

