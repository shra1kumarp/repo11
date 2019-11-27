resource "azurerm_virtual_machine" "myterraformvm" {
    count = length(var.nicid)
    name                  = "myVM"
    location              = var.rglocation
    resource_group_name   = var.rgname
    network_interface_ids =[element(var.nicid,count.index)]
    vm_size               = "Standard_DS1_v2"
    availability_set_id = var.avsetid

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
    }
}    