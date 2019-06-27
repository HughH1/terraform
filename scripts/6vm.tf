resource "azurerm_virtual_machine" "main" {
    name = "${var.prefix}-vm"
    resource_group_name = "${azurerm_resource_group.main.name}"
    location = "${azurerm_resource_group.main.location}"
    network_interface_ids = ["${azurerm_network_interface.main.id}"]
    vm_size = "Standard_DS1_v2"
       
      storage_image_reference {
       publisher = "Canonical"
       offer = "UbuntuServer"
       sku = "18.04-LTS"
       version = "latest"
      }
       storage_os_disk {
        name = "myosdisk1"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
      }
       os_profile {
        computer_name = "hostname"
        admin_username = "h1"
       
      }
      
      os_profile_linux_config {
        disable_password_authentication = true
      ssh_keys {
      path = "~/.ssh/authorized_keys"
      key_data = "${file("~/.ssh/id_rsa.pub")}"
      }
    }
      tags = {
       enviroment = "staging"
      }
 
      provisioner "remote-exec" {
      inline =["sudo apt update", "sudo apt install -y jq"]
      connetion {
        type = "ssh"
        user = "h1"
        private_key = "${file("~/.ssh.id_rsa")}"
        host = "${azurerm_public_ip.main.fqdn}"
      }
      }
    }

