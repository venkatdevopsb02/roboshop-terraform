variable vm-pip {
    type        = string
    description = "public ip name"
}

variable "rg-name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Location of resources "
}


variable "nic-name" {
  type        = string
  description = "Network interface name "
}


variable "subnet-id" {
  type        = string
  description = "subnet id data"
}


