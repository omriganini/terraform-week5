output "VNet_name" {
  value = azurerm_virtual_network.VNet.name
}
output "availabilty_set_id" {
  value       = azurerm_availability_set.website.id
  description = "the availabilty id"
}
output "nic_id" {
  value = azurerm_network_interface.web_server[*].id
}
output "database_nic_id" {
  value = [azurerm_network_interface.database.id]
}
output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.for_websits.id
}