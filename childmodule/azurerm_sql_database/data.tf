data "azurerm_mssql_server" "serverid" {
  for_each            = var.sql_database_child
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}