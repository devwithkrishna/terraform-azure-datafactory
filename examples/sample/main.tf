# # Minimal Terraform configuration for Terratest testing



module "azure" {
  source = "../../" # points to the module root

  resource_group_name             = var.resource_group_name
  location                        = var.location
  environment                     = var.environment
  application_name                = var.application_name
  temporary                       = var.temporary
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  public_network_enabled          = var.public_network_enabled
  data_factory_name               = var.data_factory_name

}