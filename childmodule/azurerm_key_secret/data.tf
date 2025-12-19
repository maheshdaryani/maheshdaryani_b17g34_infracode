
data "azurerm_key_vault" "keyid" {
  for_each            = var.secrets
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

