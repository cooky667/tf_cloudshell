//variables for the module

variable "location" {
  description = "Location"
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "rg-cloud_shell"
}

variable "vnet_name" {
  description = "Vnet Name"
  default     = "vnet-cloud_shell"
}

variable "nat_gateway_name" {
  description = "Nat Gateway Name"
  default     = "natgw-cloud_shell"
}

variable "storage_account_name" {
  description = "Storage Account Name"
  default     = "shellstorage"
}

variable "container_instance_id" {
  description = "Container Instance ID"
  default     = "5b070ec1-29a1-4f09-adb1-8596ec073a2a"
}

variable "vnet_cidr" {
  description = "Vnet CIDR"
  default     = "10.199.199.0/24"
}

variable "subnet_cidr" {
  description = "Tags"
  type        = map
  default     = {
    "subnet1" = "10.199.199.0/25",
    "subnet2" = "10.199.199.128/25",
  }
}

variable "tags" {
  description = "Tags"
  type        = map
  default     = {
    "Environment" = "Dev",
    "Owner"       = "Richard Cooke",
  }
}