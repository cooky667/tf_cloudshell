//create network profile for containers

resource "azurerm_network_profile" "network_profile" {
  name                = "cloud_shell_network_profile"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  container_network_interface {
    name = "nic"

    ip_configuration {
      name                          = "ipconfig"
      subnet_id                     = azurerm_subnet.subnet2.id
    }
  }
}
