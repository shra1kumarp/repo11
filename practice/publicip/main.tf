resource "azurerm_public_ip" "test" {
  name                = var.publicipname
  location            = var.rglocation
  resource_group_name = var.rgname
  allocation_method   = "Dynamic"
}

