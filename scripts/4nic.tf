resource "azurerm_network_interface" "main" {
    name = "${var.prefix}-nic"
    location = "${azurerm_resouce_group.main.location}"
    resource_group_name = "${azurerm_resouce_group.main.name}" 

    ip_configuration {
       name = "testconfiguration1"
       subnet_id = "${azurerm_subnet_internal.id}"
       private_ip_address_allocation = "Dynamic"
      }
    }

