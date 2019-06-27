ource "azurerm_virtual_network" "main" {
   name = "${var.prefix}-network"
   address_space = ["10.0.0.0/16"]
   location = "${azurerm_resource_group.main.location}"
   resource_group_name = "${azurerm_resouce_group.main.name}"
  }

