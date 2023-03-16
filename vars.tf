variable "vm-name" {
    type        = list(string) 
    description = "Name of the VM"
    default     = ["jumpserver", "user", "cart", "payment", "shipping", "frontend", "mongodb", "redis", "mysql", "rabbitmq", "dispatch", "catalogue"]
}

variable "vm-pip" {
    type        = list(string) 
    description = "Name of the public ip"
    default     = ["jumpserver", "frontend"]
}