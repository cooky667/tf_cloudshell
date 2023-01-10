//outputs for the module

output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.instance.id
}

output "instance_public_ip" {
  description = "Instance public IP"
  value       = aws_instance.instance.public_ip
}

output "public_ip" {
  description = "Public IP"
  value       = azurerm_public_ip.public_ip.ip_address
}