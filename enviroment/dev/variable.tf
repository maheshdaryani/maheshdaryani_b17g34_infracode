 variable"rgs_n"{
   type= map(object({
    name = string
    location= string 
}
))
 }  
  variable"vnets_n"{
    type =map(object(
        {
            name=string
            rg_name= string
            location = string
            address_space = list(string)
        }
    ))
}  

variable"subnets_n"{
    type = map(object(
        {
            name = string
            rg_name = string
            vnet_name = string
            address_prefixes = list(string)
        }
    ))
}
variable"pip_n"{
    type = map(object({
        pip_name =string
        rg_name = string
        location = string
        allocation_method = string
        sku               = string
    }))

}
 variable"nic_n"{
    type = map(object({
        nic_name= string
        vnet_name =string
        rg_name =string
        location = string
        subnet_name = string
        private_ip_address_allocation = string
        pip_name = string
      
    }))
}
variable "nsg_child" {
    type = map(object({
        nsg_name                = string
        location            = string
        resource_group_name = string
        security_rules      = map(object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string
        }))
    }))
}
variable "nic_nsg_child" {
  type = map(object({
    nic_name = string
    resource_group_name = string
    nsg_name = string

  }))
}
variable "vms" {
  type = map(object({
    vm_name             = string
    size                = string
    resource_group_name = string
    location            = string
    admin_username      = string
    admin_password      = string
    disable_password_authentication = string
    nic_name            = string
    os_disks = map(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_references = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

    script_name = optional(string)
  }))
}
variable "sql_server_child" {
  type = map(object({
    sql_server_name = string
    resource_group_name = string
    location = string
    version = string
    public_network_access_enabled = bool
    administrator_login = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version = optional(string)
    azuread_administrators = optional(list(object({
      login_username = string
      object_id      = string
 })))
  }))
}
variable "sql_database_child" {
 type = map(object({
  sql_data_name = string
#   server_id    = string
  sql_server_name    = string
  collation    = string
  license_type = string
  max_size_gb  = number
  sku_name     = string
  enclave_type = string
  resource_group_name = string

    }))
  
}
variable "key_vault_child" {
  type = map(object({
   key_vault_name                = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    tenant_id                   = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}
variable "secrets" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    resource_group_name = string
    key_vault_name       = string
  }))
}
variable "bastion_child" {
  type = map(object({
    name           = string
    location            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    pip_name            = string

  }))
}