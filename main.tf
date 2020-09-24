resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsg
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}




resource "azurerm_virtual_network" "example" {
  name                = var.vnet
  address_space       = ["13.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name


  subnet {
    name           = "subnet1"
    address_prefix = "13.0.1.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  subnet {
    name           = "subnet2"
    address_prefix = "13.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  subnet {
    name           = "subnet3"
    address_prefix = "13.0.3.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}
