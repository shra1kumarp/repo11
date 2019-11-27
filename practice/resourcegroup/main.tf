/*provider "azurerm" {
  version         = "1.36.1"
  subscription_id = "88a141e2-d0a2-4dcc-970e-1318e600e853"
  client_id       = "e88dd21d-4dba-4ce2-8f00-9d76f5c1866e"
  client_secret   = "fM4hxwR@41HHE3jrGOZ]AOL/mvGBIwG="
  tenant_id       = "84647c19-c12e-4be7-a522-9ec0bd85cbde"
}*/

resource "azurerm_resource_group" "test" {
  name     = var.rgname
  location = var.rglocation
}

