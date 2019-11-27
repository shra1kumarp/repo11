output "nicid" {
  value = azurerm_network_interface.test[*].id
}