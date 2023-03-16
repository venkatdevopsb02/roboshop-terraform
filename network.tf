# Create a virtual network within the resource group
resource "azurerm_virtual_network" "az-trainings" {
  name                = "az-trainings-vnet"
  resource_group_name = azurerm_resource_group.az-trainings.name
  location            = azurerm_resource_group.az-trainings.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "az-trainings" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.az-trainings.name
  virtual_network_name = azurerm_virtual_network.az-trainings.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_subnet_network_security_group_association" "az-trainings" {
  subnet_id                 = azurerm_subnet.az-trainings.id
  network_security_group_id = azurerm_network_security_group.az-trainings.id
}


resource "azurerm_private_dns_zone" "az-trainings" {
  name                = "roboshop.internal"
  resource_group_name = azurerm_resource_group.az-trainings.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "az-trainings" {
  name                  = "link-privatedns-to-vnet"
  resource_group_name   = azurerm_resource_group.az-trainings.name
  private_dns_zone_name = azurerm_private_dns_zone.az-trainings.name
  virtual_network_id    = azurerm_virtual_network.az-trainings.id
}