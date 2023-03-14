# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "97a52748-4367-495f-bb89-4628a4965c8a"
  client_secret   = var.client_secret
  tenant_id       = "ecfdc663-dd83-47ef-980b-636e9e2ae30b"
  subscription_id = "d8391944-774c-41db-95d3-6797158258bc"
}

