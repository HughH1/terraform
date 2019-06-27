variable "prefix" {
  default = "tfvmex"
  }

resource "azurerm_resource_group" "main"{
    name = "${var.prefix}-resource"
    location = "uksouth"
 }      
