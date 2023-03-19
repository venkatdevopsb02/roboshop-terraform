
resource "azurerm_network_interface" "az-trainings" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "az-trainings" {
  depends_on          = [azurerm_network_interface.az-trainings]
  name                = var.vm-name
  resource_group_name = var.rg-name
  location            = var.location
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
    # disk_size_gb         = 32
  }


  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS-LVM"
    sku       = "8-lvm-gen2"
    version   = "8.5.2022101401"
  }
}


resource "azurerm_dev_test_global_vm_shutdown_schedule" "az-trainings" {
  virtual_machine_id = azurerm_linux_virtual_machine.az-trainings.id
  location           = var.location
  enabled            = true

  daily_recurrence_time = "0730"
  timezone              = "Eastern Standard Time"


  notification_settings {
    enabled         = false
   
  }
 }