

output "sample" {
  value = "Hello World"
}


output "network_interface_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = module.publicipadd.azurerm_network_interface.*
  #value       = module.publicipadd.azurerm_network_interface.az-trainings.*.private_ip_address  
}

