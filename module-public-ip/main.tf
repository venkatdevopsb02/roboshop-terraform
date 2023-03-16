resource "azurerm_public_ip" "az-trainings" {
  name                = var.vm-pip
  resource_group_name = var.rg-name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "az-trainings"
  }
}

# Create network interface
data "azurerm_network_interface" "az-trainings" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.az-trainings.id
  }
}