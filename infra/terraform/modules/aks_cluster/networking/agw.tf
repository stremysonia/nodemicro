resource "azurerm_public_ip" "AGWPublicIp1" {
  name                = "AGWPublicIp1"
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  allocation_method   = "Static"
  domain_name_label   = var.azurerm_resource_group_name

  tags = {
    environment = "PROD"
  }
}


resource "azurerm_application_gateway" "app_gateway" {
  name                = "app-gateway"
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

#let application gateway know which subnet to use
gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = azurerm_subnet.AGWSubnet.id
  }

  frontend_port {
    name = "front-end-port"
    port = 80
  }

#connect appgateway with the public ip
 frontend_ip_configuration {
    name                 = "front-end-ip-config"
    public_ip_address_id = azurerm_public_ip.AGWPublicIp1.id
  }


// Here we ensure the virtual machines are added to the backend pool
// of the Azure Application Gateway

backend_address_pool{      
      name  = "videopool"
      ip_addresses = [
      "${azurerm_network_interface.app_interface1.private_ip_address}"
      ]
}

backend_address_pool {
      name  = "imagepool"
      ip_addresses = [
      "${azurerm_network_interface.app_interface2.private_ip_address}"]
  
}
      
        
 

  backend_http_settings {
    name                  = "HTTPSetting"
    cookie_based_affinity = "Disabled"
    path                  = ""
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }


 http_listener {
    name                           = "gateway-listener"
    frontend_ip_configuration_name = "front-end-ip-config"
    frontend_port_name             = "front-end-port"
    protocol                       = "Http"
  }

// This is used for implementing the URL routing rules
 request_routing_rule {
    name               = "RoutingRuleA"
    rule_type          = "PathBasedRouting"
    url_path_map_name  = "RoutingPath"
    http_listener_name = "gateway-listener"
  }

  url_path_map {
    name                               = "RoutingPath"    
    default_backend_address_pool_name   = "videopool"
    default_backend_http_settings_name  = "HTTPSetting"

     path_rule {
      name                          = "VideoRoutingRule"
      backend_address_pool_name     = "videopool"
      backend_http_settings_name    = "HTTPSetting"
      paths = [
        "/videos/*",
      ]
    }

    path_rule {
      name                          = "ImageRoutingRule"
      backend_address_pool_name     = "imagepool"
      backend_http_settings_name    = "HTTPSetting"
      paths = [
        "/images/*",
      ]
    }
  }
}
