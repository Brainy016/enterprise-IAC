variable "resource_group_name" {
    type        = string
    description = "The name of the resource group in which to create the storage account."
}

variable "location" {
    type       = string
    description = "The Azure region in which to create the storage account."
}

variable "storage_account_name" {
    type        = string
    description = "The name of the storage account to create."
}

variable "storage_account_tier" {
    type        = string
    description = "The tier of the storage account. Valid values are 'Standard' and 'Premium'."
    default     = "Standard"

    validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "The storage account tier must be either 'Standard' or 'Premium'."
  }
}

variable "replication_type" {
  type        = string
  default     = "LRS"
  description = "Defines the type of replication to use for this storage account."

  validation {
    condition     = contains(["LRS", "ZRS"], var.replication_type)
    error_message = "For budget and compliance reasons, only LRS or ZRS replication are allowed in this module."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}