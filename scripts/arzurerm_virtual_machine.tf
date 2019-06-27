variable "perfix" {
  default = "tfvmex"
}
resource "azurerm_resouce_group" "main"{
  name = "${var.perfix}-resource"
  location = "uksouth"
}

resource "azurerm_virtual_network" "main" {
  name = "${var.prefix}-network"
  address_space = ["10.0.0.0/16"]
  location = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resouce_group.main.name}"
}

resource "azurerm_subnet" "internal" {
  name = "internal"
  resource_group_name = "${azurerm_resouce_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix = "10.0.0.0/24"
}

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

