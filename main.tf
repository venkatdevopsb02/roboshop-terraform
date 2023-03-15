# Create a resource group
resource "azurerm_resource_group" "az-trainings" {
  name     = "az-trainings-rg"
  location = "Canada Central"
}


resource "azurerm_public_ip" "az-trainings" {
  name                = "jumpserver-pip"
  location            = azurerm_resource_group.az-trainings.location
  resource_group_name = azurerm_resource_group.az-trainings.name
  allocation_method   = "Dynamic"
}
