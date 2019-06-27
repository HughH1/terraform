resource "azurerm_virtual_machine" "main" {
    name = "${var.prefix}-vm"
    location = "${azurerm_resouce_group.main.location}"
    network_interface_ids = ["${azurerm_network_interface.main.id}"]
    vm_size = "Standard_DS1_v2"
       
      storage_image_refernce {
       publisher = "Canonical"
       offer = "UbuntuServer"
       sku = "18.04-LTS"
      }
       storage_os_disk {
        name = "myosdisk1"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standart_LRS"
      }
       os_profile {
        computer_name = "hostname"
        admin_username = "admin123"
        admin_password = "Password12345!"
      }
      
      os_profile_linux_config {
        disable_password_authentication = false
      }
      tags = {
       enviroment = "staging"
      }
  }

