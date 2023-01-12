//variables for the module

variable "location" {
  description = "Location"
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "rg01"
}

variable "vnet_name" {
  description = "Vnet Name"
  default     = "vnet01"
}

variable "nat_gateway_name" {
  description = "Nat Gateway Name"
  default     = "natgw01"
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
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Tags"
  type        = map
  default     = {
    "subnet1" = "10.0.0.0/24",
    "subnet2" = "10.0.1.0/24",
  }
}

variable "tags" {
  description = "Tags"
  type        = map
  default     = {
    "Environment" = "Dev",
    "Owner"       = "John Doe",
  }
}