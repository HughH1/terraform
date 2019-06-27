variable "perfix" {
  default = "tfvmex"
  }

resource "azurerm_resouce_group" "main"{
    name = "${var.perfix}-resource"
    location = "uksouth"
 }      
