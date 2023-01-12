
resource "azurerm_role_assignment" "network_profile_contributor" {
  scope                = azurerm_network_profile.network_profile.id
  role_definition_name = "Network Contributor"
  principal_id         = var.container_instance_id
}

resource "azurerm_role_assignment" "azure_relay_contributor" {
  scope                = azurerm_relay_namespace.relay.id
  role_definition_name = "Contributor"
  principal_id         = var.container_instance_id
}
