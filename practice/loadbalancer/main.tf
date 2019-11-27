resource "azurerm_lb" "test" {
  name                = "TestLoadBalancer"
  location            = var.rglocation
  resource_group_name = var.rgname

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.publicipid
  }
}