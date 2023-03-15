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

module "linuxservers" {
  source              = "./module-vm"
  vm-name             = "jumpserver" 
  rg-name             = azurerm_resource_group.az-trainings.name
  location            = azurerm_resource_group.az-trainings.location
  subnet-id           = azurerm_subnet.az-trainings.id
  nic-name            = "az-trainings-nic"
}