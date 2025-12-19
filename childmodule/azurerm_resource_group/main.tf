resource "azurerm_resource_group" "terraform_rg" {
    for_each =var.rgs
  name     = each.value.name
  location = each.value.location
  
}