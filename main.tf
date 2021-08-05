resource "azurerm_resource_group" "db_backup" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

module "backup_sa" {
  depends_on = [
    azurerm_resource_group.db_backup
  ]

  // #TODO(ekarlso): Remove once it's migrated to TiE repo
  source = "github.com/TietoEVRY-DataPlatforms/terraform-azurerm-storage?ref=patch-1"

  resource_group_name = azurerm_resource_group.db_backup.name
  location            = azurerm_resource_group.db_backup.location

  storage_account_name = "db${var.sa_name}"

  # To enable advanced threat protection set argument to `true`
  enable_advanced_threat_protection = false

  # Container lists with access_type to create
  containers_list = []

  network_rules = var.network_rules

  tags = var.tags
}

# Allow backup identity to access Backup Storage Accoutn for Velero
resource "azurerm_user_assigned_identity" "backup_identity" {
  name                = "id-${var.msi_name}-backup"
  resource_group_name = azurerm_resource_group.db_backup.name
  location            = azurerm_resource_group.db_backup.location
}

resource "azurerm_role_assignment" "backup_id_sa_data_contributor" {
  depends_on           = [module.backup_sa]
  scope                = module.backup_sa.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.backup_identity.principal_id
}

# ----- Allow VMSS to use Backup UAM ----- #
resource "azurerm_role_assignment" "mi_backup_operator_backup" {
  for_each             = toset(var.msi_identities)
  scope                = azurerm_user_assigned_identity.backup_identity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = each.key
}
