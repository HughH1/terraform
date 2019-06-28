#!/bin/bash

resource "azurerm_public_ip" "main" {
  name = "MyPublicIP"
  location = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  allocation_method = "Dynamic"
  domain_name_label = "h1-${formatdate("DDMMYYhhmmss", timestamp())}"

  tags = {
    enviroment = "staging"
  }
}
