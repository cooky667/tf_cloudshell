//terraform state in Azure storage account

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "terraformstatestorage"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
