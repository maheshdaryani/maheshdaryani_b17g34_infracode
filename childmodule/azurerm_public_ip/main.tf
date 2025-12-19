resource "azurerm_public_ip""my_pip"{
    for_each = var.pip
    name = each.value.pip_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    allocation_method = each.value.allocation_method
    sku               = each.value.sku 
}
