terraform {
  # This block tells Terraform to store the state in your new Azure bucket
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate4194devops"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate" # The name of the file it will create in Azure
    use_oidc             = true                    # Prepares it for our passwordless GitHub pipeline
  }
}

provider "azurerm" {
  features {}
  use_oidc = true 
}

resource "azurerm_resource_group" "dev_rg" {
  name     =  "dev_rg"
  location = "spaincentral"
}

# module "secure_storage" {
#   source                = "../../module/azurerm-storage"
#   resource_group_name   = azurerm_resource_group.dev_rg.name
#   location              = azurerm_resource_group.dev_rg.location
#   storage_account_name  = "devstorageacct2334"
#     tags                  = {
#     environment = "dev"
    
#   }
# }

# output "storage_account_id" {
#   value       = module.secure_storage.storage_account_id
#   description = "The ID of the Storage Account."
# }

# output "primary_blob_endpoint" {
#   value       = module.secure_storage.primary_blob_endpoint
#   description = "The endpoint URL for blob storage."
# }


# module "enterprise_network" {
#   source = "../../module/azurerm-vnet"
#   resource_group_name = azurerm_resource_group.dev_rg.name
#   location = azurerm_resource_group.dev_rg.location
#   vnet_name = "dev-vnet"
#   vnet_address_space = ["10.0.0.0/16"]
#   tags = {
#     environment = "dev"
#   }
#   subnets = {
#     "web-tier-subnet" = {
#       address_prefixes = ["10.0.1.0/24"]
#     }
#     "db-tier-subnet" = {
#       address_prefixes = ["10.0.2.0/24"]
#     }
# }

# output "network_subnet_ids" {
#   value = module.enterprise_network.subnet_ids
# }