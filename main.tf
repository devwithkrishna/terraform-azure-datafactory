# #This is the main configuration file where Azure resources are defined
# #It contains the actual infrastructure as code declarations

# resource "azurerm_resource_group" "main" {
#   name     = var.resource_group_name
#   location = var.location

#   tags = {
#     Environment = var.environment,
#     ApplicationName = var.application_name
#     Temporary = var.temporary
#   }
# }

