/*
resource "azurerm_lb_nat_pool" "example" {
  resource_group_name            = var.azurerm_resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "SSH"
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
}


frontend_port_start            = 80
  frontend_port_end              = 81
  backend_port                   = 8080

*/