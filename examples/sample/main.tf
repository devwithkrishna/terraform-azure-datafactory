# # Minimal Terraform configuration for Terratest testing



# module "azure" {
#   source = "../../"   # points to the module root

#   resource_group_name     = var.resource_group_name
#   location                = var.location
#   environment             = var.environment
#     application_name        = var.application_name
#     temporary               = var.temporary

# }