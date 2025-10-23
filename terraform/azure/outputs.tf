output "vm_public_ip" {
  description = "Public IP address of the Azure VM"
  value       = azurerm_public_ip.main.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the Azure VM"
  value       = azurerm_network_interface.main.private_ip_address
}

output "vm_id" {
  description = "Azure VM ID"
  value       = azurerm_linux_virtual_machine.main.id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = azurerm_resource_group.main.id
}

output "storage_account_name" {
  description = "Storage account name"
  value       = azurerm_storage_account.main.name
}

output "storage_account_id" {
  description = "Storage account ID"
  value       = azurerm_storage_account.main.id
}

output "virtual_network_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.main.name
}

output "virtual_network_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.main.id
}

output "network_security_group_id" {
  description = "Network security group ID"
  value       = azurerm_network_security_group.main.id
}

output "network_interface_id" {
  description = "Network interface ID"
  value       = azurerm_network_interface.main.id
}