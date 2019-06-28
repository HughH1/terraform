resource "azurerm_network_interface" "main" {
    name = "${var.prefix}-nic"
    location = "${azurerm_resource_group.main.location}"
    resource_group_name = "${azurerm_resource_group.main.name}" 
    network_security_group_id = "${azurerm_network_security_group.main.id}"

    ip_configuration {
       name = "testconfiguration1"
       subnet_id = "${azurerm_subnet.internal.id}"
       private_ip_address_allocation = "Dynamic"      
       public_ip_address_id = "${azurerm_public_ip.main.id}"
      }
    }

