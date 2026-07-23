variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the virtual network."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network to create."
  type        = string
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
  description = "A map of subnets to create inside the VNet."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources."
  default     = {}
}
