//private endpoint for relay
resource "azurerm_private_endpoint" "relay" {
  name                = "cloud_shell_relay"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet["subnet1"].id
  private_service_connection {
    name                           = "cloud_shell_relay"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_relay_namespace.relay.id
    subresource_names              = ["hybridConnections"]
  }
  tags = var.tags
}
