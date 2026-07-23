resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.replication_type
  tags = var.tags
  # Enterprise Security Defaults - Locked down
#   min_tls_version          = "TLS1_2"
#   https_traffic_only_enabled = true
}