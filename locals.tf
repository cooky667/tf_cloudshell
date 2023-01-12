locals {
    storage_account_name = "${var.storage_account_name}${random_string.random.result}"

}

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}
