resource "azurerm_network_interface" "my_nic" {
    for_each = var.nic
    name = each.value.nic_name
    resource_group_name = each.value.rg_name
    location = each.value.location

    ip_configuration {
      name    = "ipconfig1"
       subnet_id = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = each.value.private_ip_address_allocation
        public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
  
}
