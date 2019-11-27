resource "azurerm_network_interface" "test" {
  count = length(var.subnet_id)
  name                = element(var.nicname,count.index)
  location            = var.rglocation
  resource_group_name = var.rgname

  ip_configuration {
    name                          = var.ipconfigname
    subnet_id                     = element(var.subnet_id,count.index)
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}
