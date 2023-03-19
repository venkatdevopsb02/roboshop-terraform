# Create a resource group
resource "azurerm_resource_group" "az-trainings" {
  name     = "az-trainings-rg"
  location = "Canada Central"
}




module "linuxservers" {
  source              = "./module-vm"
  for_each            = toset(var.vm-name)
  vm-name             = each.value 
  rg-name             = azurerm_resource_group.az-trainings.name
  location            = azurerm_resource_group.az-trainings.location
  subnet-id           = azurerm_subnet.az-trainings.id
  nic-name            = "nic-${each.value}"
}

module "publicipadd" {
  source              = "./module-vm-public"
  for_each            = toset(var.vm-pip)
  vm-name             = each.value 
  rg-name             = azurerm_resource_group.az-trainings.name
  location            = azurerm_resource_group.az-trainings.location
  subnet-id           = azurerm_subnet.az-trainings.id
  nic-name            = "nic-${each.value}"
  depends_on          = [module.linuxservers]
}