//deploy nat gateway for subnets
/*
resource "azurerm_nat_gateway" "nat_gateway" {
  name                  = var.nat_gateway_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  sku_name              = "Standard"
  idle_timeout_in_minutes = 4
}

resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_public_ip_association" {
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = azurerm_public_ip.public_ip.id
}

resource "azurerm_subnet_nat_gateway_association" "nat_gateway_association" {
  subnet_id      = azurerm_subnet.subnet2.id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}
*/