//create storage account with accesss from vnet only
resource "azurerm_storage_account" "storage" {
  name                     = "terraformstatestorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action = "Deny"
    virtual_network_subnet_ids = [
      azurerm_subnet.subnet[0].id
    ]
  }
}

//create file share in storage account
resource "azurerm_storage_share" "share" {
  name                 = "terraform-state"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}