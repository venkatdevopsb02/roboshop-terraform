
resource "azurerm_network_security_group" "az-trainings" {
  name                = "nsg-az-trainings"
  location            = azurerm_resource_group.az-trainings.location
  resource_group_name = azurerm_resource_group.az-trainings.name
}

resource "azurerm_network_security_rule" "nsgrule1" {
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "184.147.210.71/32"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az-trainings.name
  network_security_group_name = azurerm_network_security_group.az-trainings.name
}

resource "azurerm_network_security_rule" "nsgrule2" {
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

resource "azurerm_network_security_rule" "nsgrule3" {
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