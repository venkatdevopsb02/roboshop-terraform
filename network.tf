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