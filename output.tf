output "identity" {
  value = {
    principal_id = azurerm_user_assigned_identity.backup_identity.principal_id
    resource_id  = azurerm_user_assigned_identity.backup_identity.id
  }
}

output "storage_account" {
  value = module.backup_sa.storage_account_name
}
