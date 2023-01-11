//deploy vnet in uk south
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
  tags                = var.tags
}

//deploy subnets in vnet

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_cidr
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  service_endpoints    = ["Microsoft.Storage"]
  private_endpoint_network_policies = "Disabled"
}

