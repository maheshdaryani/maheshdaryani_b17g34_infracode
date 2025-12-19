output "vnet_ids" {
  value = {for k, f in azurerm_virtual_network.my_vnet : k => f.id }
}
