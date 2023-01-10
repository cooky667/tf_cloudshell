//deploy nat gateway for subnets

resource "azurerm_nat_gateway" "nat_gateway" {
  for_each             = var.subnet_cidr
  name                 = each.key
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  public_ip_address_id = azurerm_public_ip.nat_ip[each.key].id
  sku_name             = "Standard"
}