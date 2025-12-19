module"azurerm_resource_group"{
    source = "../../childmodule/azurerm_resource_group"
    rgs = var.rgs_n
}
module"azurerm_virtual_network"{
    source ="../../childmodule/azurerm_vent"
    vnets=var.vnets_n
    depends_on = [ module.azurerm_resource_group]
}
module"azurerm_subnet"{
    source ="../../childmodule/azurerm_subnet"
    subnets = var.subnets_n
    depends_on = [module.azurerm_virtual_network ]

}
module "azurerm_public_ip"{
    source = "../../childmodule/azurerm_public_ip"
    depends_on = [ module.azurerm_resource_group ]
    pip = var.pip_n
}
module "azurerm_nic"{
    source ="../../childmodule/azurerm_nic"
    depends_on =[module.azurerm_subnet,module.azurerm_public_ip]
     nic  = var.nic_n
}
module"azurerm_network_security_group"{
    source = "../../childmodule/azurerm_nsg"
    nsg_child = var.nsg_child
    depends_on = [module.azurerm_resource_group]

}
module"azurerm_network_interface_security_group_association"{
    source= "../../childmodule/azurerm_nic_nsg"
    nic_nsg_child = var.nic_nsg_child
    depends_on = [ module.azurerm_nic,module.azurerm_network_security_group ]
}
module"azurerm_linux_vitrual_machine"{
    source = "../../childmodule/azurerm_linux_vm"
    vms = var.vms
    depends_on = [ module.azurerm_nic,module.azurerm_network_security_group,module.azurerm_network_interface_security_group_association ]
}
module"azurerm_sql_server"{
    source = "../../childmodule/azurerm_sql_server"
    sql_server_child = var.sql_server_child
    depends_on = [ module.azurerm_resource_group ]
}
module"azurerm_sql_database"{
    source = "../../childmodule/azurerm_sql_database"
    sql_database_child = var.sql_database_child
      depends_on = [module.azurerm_resource_group,module.azurerm_sql_server]
}
module"azurerm_key_vault"{
    source = "../../childmodule/azurerm_key_vault"
    key_vault_child = var.key_vault_child
    depends_on = [ module.azurerm_resource_group ]
}
module "azurerm_key_secret" {
  source = "../../childmodule/azurerm_key_secret"
  secrets =var.secrets
  depends_on = [module.azurerm_key_vault]
 
}
module"azurerm_bastion"{
    source ="../../childmodule/azurerm_bastion"
    bastion_child = var.bastion_child
     depends_on = [module.azurerm_virtual_network]
}