terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "impressodev"
    storage_account_name = "impressodevstore"
    container_name       = "testinfra"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "newtestgroup" {
  name     = "newtestgroup"
  location = "westus"
}

locals {
  backend_address_pool_name      = "${azurerm_virtual_network.dev-test-vnet.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.dev-test-vnet.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.dev-test-vnet.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.dev-test-vnet.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.dev-test-vnet.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.dev-test-vnet.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.dev-test-vnet.name}-rdrcfg"
}

# Create virtual network
resource "azurerm_virtual_network" "dev-test-vnet" {
    name                = "dev-test-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.newtestgroup.location
    resource_group_name = azurerm_resource_group.newtestgroup.name

    tags = {
        environment = "dev-test-vnet"
    }
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.newtestgroup.name
  virtual_network_name = azurerm_virtual_network.dev-test-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "example2" {
  name                 = "example-subnet2"
  resource_group_name  = azurerm_resource_group.newtestgroup.name
  virtual_network_name = azurerm_virtual_network.dev-test-vnet.name
  address_prefixes     = ["10.0.2.0/24"]

}
resource "azurerm_subnet" "example3" {
  name                 = "example-subnet3"
  resource_group_name  = azurerm_resource_group.newtestgroup.name
  virtual_network_name = azurerm_virtual_network.dev-test-vnet.name
  address_prefixes     = ["10.0.3.0/24"]

}