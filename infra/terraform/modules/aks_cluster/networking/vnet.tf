resource "azurerm_virtual_network" "prodimpressonetwork" {
  name                = "prod-impresso-network"
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name
  address_space       = ["10.0.0.0/16"]
  
  tags = {
    environment = "PROD"
  }
}



