# Create a resource group
resource "azurerm_resource_group" "az-trainings" {
  name     = "az-trainings-rg"
  location = "Canada Central"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "az-trainings" {
  name                = "az-trainings-vnet"
  resource_group_name = azurerm_resource_group.az-trainings.name
  location            = azurerm_resource_group.az-trainings.location
  address_space       = ["10.0.0.0/16"]
}