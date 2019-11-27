resource "azurerm_subnet" "test" {
  count                = length(var.subnetaddress)
  name                 = element(var.subnetname, count.index)
  resource_group_name  = var.rgname
  virtual_network_name = var.vnetname
  address_prefix       = element(var.subnetaddress, count.index)
}
