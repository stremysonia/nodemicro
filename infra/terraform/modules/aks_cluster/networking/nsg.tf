resource "azurerm_network_security_group" "app_http_nsg" {
  name                = "app-http-nsg"
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name

# allow http traffic on port 80
  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.app_http_nsg.id
}
