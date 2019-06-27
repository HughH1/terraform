resource "azurerm_subnet" "internal" {
  name = "internal"
  resource_group_name = "${azurerm_resouce_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix = "10.0.0.0/24"
}

