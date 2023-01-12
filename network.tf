//deploy vnet in uk south
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
  tags                = var.tags
}

//deploy subnets in vnet

resource "azurerm_subnet" "subnet1" {
  name                 = "cloud_shell_relay"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr["subnet1"]]
  service_endpoints    = ["Microsoft.Storage"]
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_subnet" "subnet2" {
  name                 = "cloud_shell_containers"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      #actions = ["Microsoft.Network/virtualNetworks/subnets/join/action",
      #           "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      #           "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
  address_prefixes     = [var.subnet_cidr["subnet2"]]
  service_endpoints    = ["Microsoft.Storage"]
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_subnet_nat_gateway_association" "nat_gateway_association" {
  subnet_id      = azurerm_subnet.subnet2.id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}
