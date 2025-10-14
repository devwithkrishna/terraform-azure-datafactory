# Outputs for Terratest to validate

output "resource_group_name" {
  description = "Name of the test resource group"
  value       = module.azure.resource_group
}

output "data_factory_name" {
  description = "Name of the test data factory"
  value       = module.azure.data_factory_name
}

output "public_access_enabled" {
  description = "Public Access enabled or not"
  value       = module.azure.public_access_enabled
}

output "data_factory_id" {
  description = "Id of Azure Data Factory resource"
  value       = module.azure.data_factory_id
}

output "datafactory_tags" {
  description = "Azure data factory tags"
  value       = module.azure.datafactory_tags
}