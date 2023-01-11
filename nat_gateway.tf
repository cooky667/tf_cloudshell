//deploy nat gateway for subnets

resource "azurerm_nat_gateway" "nat_gateway" {
  name                 = var.nat_gateway_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  public_ip_address_id = azurerm_public_ip.public_ip.id
  sku_name             = "Standard"
  idle_timeout_in_minutes = 4
}