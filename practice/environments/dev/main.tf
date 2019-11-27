provider "azurerm" {
  version         = "1.36.1"
  subscription_id = "88a141e2-d0a2-4dcc-970e-1318e600e853"
  client_id       = "e88dd21d-4dba-4ce2-8f00-9d76f5c1866e"
  client_secret   = "fM4hxwR@41HHE3jrGOZ]AOL/mvGBIwG="
  tenant_id       = "84647c19-c12e-4be7-a522-9ec0bd85cbde"
}

module "resourcegroup" {
  source     = "../../resourcegroup"
  rgname     = var.rgname
  rglocation = var.rglocation
}

module "vnet" {
  source      = "../../vnet"
  vnetname    = var.vnetname
  rglocation  = module.resourcegroup.location
  rgname      = module.resourcegroup.name
  vnetaddress = var.vnetaddress
}

module "subnet" {
  source        = "../../subnet"
  subnetname    = var.subnetname
  rgname        = module.resourcegroup.name
  vnetname      = module.vnet.vnetname
  subnetaddress = var.subnetaddress
}
module "publicip" {
  source       = "../../publicip"
  publicipname = var.publicipname
  rglocation   = module.resourcegroup.location
  rgname       = module.resourcegroup.name
}

module "nic" {
  source       = "../../nic"
  nicname      = var.nicname
  rglocation   = module.resourcegroup.location
  rgname       = module.resourcegroup.name
  ipconfigname = var.ipconfigname
  subnet_id = module.subnet.id
  public_ip_id = module.publicip.id
}
module "avset" {
  source = "../../avset"
  rglocation   = module.resourcegroup.location
  rgname       = module.resourcegroup.name

}
module "loadbalancer" {
  source = "../../loadbalancer"
  rglocation   = module.resourcegroup.location
  rgname       = module.resourcegroup.name
  publicipid = module.publicip.id 
}

module "vm" {
  source = "../../vm"
  rglocation   = module.resourcegroup.location
  rgname       = module.resourcegroup.name
  nicid = module.nic.nicid
  avsetid = module.avset.avsetid
}

