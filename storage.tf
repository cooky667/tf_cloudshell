//create storage account with accesss from vnet only
resource "azurerm_storage_account" "storage" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action = "Deny"
    virtual_network_subnet_ids = [
      azurerm_subnet.subnet2.id
    ]

    ip_rules = ["81.108.181.70"]
  }
}

//create file share in storage account
resource "azurerm_storage_share" "share" {
  name                 = "profile"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}