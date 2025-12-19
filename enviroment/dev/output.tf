output "vnetid" {
  value = module.azurerm_virtual_network
}
output "nicid" {
  value = module.azurerm_nic
}

output "kv_output" {
  value = module.azurerm_key_vault
}

