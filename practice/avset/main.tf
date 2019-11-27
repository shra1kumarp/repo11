resource "azurerm_availability_set" "test" {
    name = "myavset"
    location = var.rglocation
    resource_group_name = var.rgname
}