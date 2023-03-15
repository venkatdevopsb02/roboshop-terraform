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

resource "azurerm_network_interface" "az-trainings" {
  depends_on          = [azurerm_public_ip.az-trainings]
  name                = "az-trainings-nic"
  location            = azurerm_resource_group.az-trainings.location
  resource_group_name = azurerm_resource_group.az-trainings.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.az-trainings.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.az-trainings.id
  }
}



resource "azurerm_linux_virtual_machine" "az-trainings" {
  depends_on          = [azurerm_network_interface.az-trainings]
  name                = "jumpserver"
  resource_group_name = azurerm_resource_group.az-trainings.name
  location            = azurerm_resource_group.az-trainings.location
  size                = "Standard_B1s"
  admin_username      = "centos"
  admin_password      = "DevOps654321"

  disable_password_authentication = false 

  network_interface_ids = [
    azurerm_network_interface.az-trainings.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 32
  }


  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS-LVM"
    sku       = "8-lvm-gen2"
    version   = "8.5.2022101401"
  }
}