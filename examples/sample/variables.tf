# # Variables for the test configuration

variable "resource_group_name" {
  description = "Name of the resource group for testing"
  type        = string
}

variable "data_factory_name" {
  description = "Azure data factory name"
  type        = string
}

variable "location" {
  description = "Azure region for testing"
  type        = string
  default     = "East US2"
}

variable "environment" {
  description = "Environment tag for testing"
  type        = string
  default     = "DEV"
}

variable "application_name" {
  description = "value for application name tag"
  type        = string
  default     = "oscar"
}

variable "temporary" {
  description = "temporary name tag"
  type        = string
  default     = "TRUE"
}

variable "managed_virtual_network_enabled" {
  description = "Is Managed Virtual Network enabled"
  default     = "true"
  type        = string
}

variable "public_network_enabled" {
  description = "Is Public Network enabled"
  default     = "true"
  type        = string
}