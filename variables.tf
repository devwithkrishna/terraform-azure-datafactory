# This file defines all input variables for your Terraform configuration
# Variables allow users to customize the deployment without modifying code

variable "resource_group_name" {
  type        = string
  description = "Azure Datafactory Rg"
}

variable "location" {
  type        = string
  description = "Azure Data factory location"
}

variable "data_factory_name" {
  description = "Azure Data factory name"
  type        = string
}

variable "environment" {
  description = "Environment tag value in Azure"
  type        = string
  validation {
    condition     = contains(["DEV", "QA", "UAT", "PROD"], var.environment)
    error_message = "Environment value should be one among DEV or QA or UAT or PROD."
  }
}

variable "application_name" {
  description = "Azure application name tag"
  type        = string
}


variable "temporary" {
  description = "Temporary tag value in Azure"
  type        = string
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.temporary))
    error_message = "The temporary tag value must be either 'TRUE' or 'FALSE'."
  }
}

variable "managed_virtual_network_enabled" {
  description = "Is Managed Virtual Network enabled"
  type        = string
}

variable "public_network_enabled" {
  description = "Is Public Network enabled"
  type        = string
}