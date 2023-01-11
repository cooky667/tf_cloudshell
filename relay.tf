// deploy relay for cloud shell
resource "azurerm_relay_namespace" "relay" {
  name                = "cloud_shell_relay"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vnet_enabled        = true
  vnet_name           = azurerm_virtual_network.vnet.name
  subnet_name         = azurerm_subnet.subnet["subnet1"].name
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_relay_hybrid_connection" "relay" {
  name                 = "cloud_shell_relay"
  resource_group_name  = azurerm_resource_group.rg.name
  relay_namespace_name = azurerm_relay_namespace.relay.name
  requires_client_authorization = true
  user_metadata = "cloud_shell_relay"
}