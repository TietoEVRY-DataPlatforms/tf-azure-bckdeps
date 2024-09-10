# Azure Backup Storage Account Dependency Module

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backup_sa"></a> [backup\_sa](#module\_backup\_sa) | github.com/TietoEVRY-DataPlatforms/terraform-azurerm-storage | v6.0.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.db_backup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.backup_id_sa_data_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.mi_backup_operator_backup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.backup_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled) | Should cross Tenant replication be enabled? | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_msi_identities"></a> [msi\_identities](#input\_msi\_identities) | n/a | `list` | `[]` | no |
| <a name="input_msi_name"></a> [msi\_name](#input\_msi\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | n/a | `list` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_sa_name"></a> [sa\_name](#input\_sa\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_storage_account"></a> [storage\_account](#output\_storage\_account) | n/a |
<!-- END_TF_DOCS -->