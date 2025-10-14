[![terraform-lint](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/terraform-lint.yml/badge.svg)](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/terraform-lint.yml)
[![go](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/go.yml/badge.svg)](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/go.yml)
[![update-readme](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/update-readme.yml/badge.svg)](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/update-readme.yml)
[![create-release](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/release.yml/badge.svg)](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/release.yml)
[![auto-fill-readme](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/auto-fill-readme.yml/badge.svg)](https://github.com/devwithkrishna/terraform-azure-datafactory/actions/workflows/auto-fill-readme.yml)

# terraform-azure-datafactory

## Examples

Please find the [examples]((https://github.com/devwithkrishna/terraform-azure-datafactory/tree/main/examples)) here 

## 📂 Structure

<!-- BEGIN_REPO_TREE -->
```
.
├── .gitignore
├── CODEOWNERS
├── LICENSE
├── README.md
├── docs
│   └── contributing.md
├── examples
│   └── sample
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       └── variables.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── test
│   ├── README.md
│   ├── go.mod
│   ├── go.sum
│   └── terratest_test.go
└── variables.tf

5 directories, 17 files
```
<!-- END_REPO_TREE -->


## Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0, < 4.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0, < 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.data_factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |
| [azurerm_resource_group.data_factory_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Azure application name tag | `string` | n/a | yes |
| <a name="input_data_factory_name"></a> [data\_factory\_name](#input\_data\_factory\_name) | Azure Data factory name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment tag value in Azure | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure Data factory location | `string` | n/a | yes |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | Is Managed Virtual Network enabled | `string` | n/a | yes |
| <a name="input_public_network_enabled"></a> [public\_network\_enabled](#input\_public\_network\_enabled) | Is Public Network enabled | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure Datafactory Rg | `string` | n/a | yes |
| <a name="input_temporary"></a> [temporary](#input\_temporary) | Temporary tag value in Azure | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_id"></a> [data\_factory\_id](#output\_data\_factory\_id) | Id of Azure Data Factory resource |
| <a name="output_data_factory_location"></a> [data\_factory\_location](#output\_data\_factory\_location) | Azure data factory location |
| <a name="output_data_factory_name"></a> [data\_factory\_name](#output\_data\_factory\_name) | Azure Data Factory name |
| <a name="output_datafactory_tags"></a> [datafactory\_tags](#output\_datafactory\_tags) | Azure data factory tags |
| <a name="output_public_access_enabled"></a> [public\_access\_enabled](#output\_public\_access\_enabled) | Azure datafactory enabled public access or not |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Azure data factory resource group name |
<!-- END_TF_DOCS -->


## How to generate this README

This README section is automatically generated using [terraform-docs](https://terraform-docs.io/)a powerful documentation generator for Terraform modules.

It parses your module’s variables, outputs, providers, and resources to produce consistent and up-to-date Markdown documentation directly inside your README file.

Execute below to generate latest docs

```bash
terraform-docs markdown table --output-file README.md --output-mode inject .
```


#### This repository is maintained by devwithkrishna.
