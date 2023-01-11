//outputs for the module

output "public_ip" {
  description = "Public IP"
  value       = azurerm_public_ip.public_ip.ip_address
}