variable "vm-name" {
    type        = list(string) 
    description = "Name of the VM"
    default     = [ "user", "cart", "payment", "shipping", "mongodb", "redis", "mysql", "rabbitmq", "dispatch", "catalogue"]
}

variable "vm-pip" {
    type        = list(string) 
    description = "Name of the public ip"
    default     = ["jumpserver", "frontend"]
}