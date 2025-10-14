# This is the main configuration file where Azure resources are defined
# It contains the actual infrastructure as code declarations

resource "azurerm_resource_group" "data_factory_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_data_factory" "data_factory" {
  name                   = var.data_factory_name
  resource_group_name    = azurerm_resource_group.data_factory_rg.name
  location               = azurerm_resource_group.data_factory_rg.location
  public_network_enabled = var.public_network_enabled

  managed_virtual_network_enabled = var.managed_virtual_network_enabled

  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.data_factory_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
  depends_on = [azurerm_resource_group.data_factory_rg]
  lifecycle {
    ignore_changes = [tags]
  }
}
