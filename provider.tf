//required providers azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.38.0"
    }
  }
}

//required provider azurerm
provider "azurerm" {
  features {}
}