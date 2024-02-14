resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = azurerm_virtual_network.prodimpressonetwork.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "AGWSubnet" {
  name                 = "AGWSubnet"
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = azurerm_virtual_network.prodimpressonetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = azurerm_virtual_network.prodimpressonetwork.name
  address_prefixes     = ["10.0.3.0/24"]
}