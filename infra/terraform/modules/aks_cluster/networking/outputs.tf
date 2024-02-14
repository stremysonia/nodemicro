output "public_ip" {
  value = azurerm_public_ip.PublicIp1.ip_address
}
output "public_ip_fqdn" {
  value = azurerm_public_ip.PublicIp1.fqdn
}