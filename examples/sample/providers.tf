# This file configures the Terraform providers and backend settings
# It defines which providers are required and their version constraints

# terraform {
#   required_version = ">= 1.0"

#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = ">= 4.0, < 4.40.0"
#     }
#   }
# }


# # Configure the Azure provider
# provider "azurerm" {
#   features {}  # Required block for Azure provider, can configure specific features here
  
#   # TODO: Add authentication methods if not using Azure CLI/Environment variables
#   # subscription_id = var.subscription_id
#   # tenant_id       = var.tenant_id
#   # client_id       = var.client_id
#   # client_secret   = var.client_secret
# }