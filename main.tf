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


resource "azurerm_network_security_group" "az-trainings" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.az-trainings.location
  resource_group_name = azurerm_resource_group.az-trainings.name
}

resource "azurerm_network_security_rule" "az-trainings" {
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az-trainings.name
  network_security_group_name = azurerm_network_security_group.az-trainings.name
}

resource "azurerm_network_security_rule" "az-trainings" {
  name                        = "allow-80"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az-trainings.name
  network_security_group_name = azurerm_network_security_group.az-trainings.name
}

resource "azurerm_network_security_rule" "az-trainings" {
  name                        = "allow-8080"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8080"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az-trainings.name
  network_security_group_name = azurerm_network_security_group.az-trainings.name
}