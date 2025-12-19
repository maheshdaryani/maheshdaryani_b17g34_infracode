rgs_n ={
    rg1={
        name="rg-terraform-01"
        location="eastus"
    }   
}

vnets_n ={
    vnet1 ={
        name= "terraform_vnet1"
        rg_name = "rg-terraform-01"
        location = "eastus"
        address_space = ["10.0.0.0/16"]
    }
}
subnets_n = {
    subnet1 ={
        name = "terraform_subnet"
        rg_name ="rg-terraform-01"
        vnet_name ="terraform_vnet1"
        address_prefixes =["10.0.1.0/24"]

    }
   subnetB = {
        name             = "AzureBastionSubnet"          # ✔ REQUIRED NAME
        address_prefixes = ["10.0.40.0/24"]  
        rg_name ="rg-terraform-01"
        vnet_name ="terraform_vnet1"             # ✔ Valid prefix
      }

}
pip_n= {
    pip1 ={
    pip_name= "terraform_pip"
    rg_name= "rg-terraform-01"
    location = "eastus"
    allocation_method ="Dynamic"
    sku          =      "Basic"
    }
}
 
nic_n = {
    nic1 = {
      nic_name = "terraform_nic1"
      rg_name = "rg-terraform-01"
      location = "eastus"
      subnet_name  = "terraform_subnet"
       pip_name  =  "terraform_pip"
       private_ip_address_allocation = "Dynamic"
       vnet_name = "teraform_vnet1"
      
    }
}
nsg_child = {
  "nsg1" = {
    nsg_name                = "nsg_test1"
    location            = "eastus"
    resource_group_name = "rg-terraform-01"

    security_rules = {
      secret1 = {
        name                       = "ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"

      }
    }

  }
}

nic_nsg_child = {
  nic_nsg1 = {
    nic_name            = "terraform_nic1"
    resource_group_name = "rg-terraform-01"
    nsg_name            = "nsg_test1"
  }
}
vms = {
  vm1 = {
    vm_name             =  "terraform_vm1"
    size                = "Standard_F2"
    resource_group_name = "rg-terraform-01"
    location            = "eastus"
    admin_username      = "admin123"
    admin_password      = "password@123"
    disable_password_authentication = "false"
    nic_name            = "terraform_nic1"
    os_disks = {

      os_disks1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    source_image_references = {
      source_image1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
  }
}
sql_server_child = {
  sql1 = {
    sql_server_name ="terraform-sqlserver" 
    location = "eastus"
    resource_group_name = "rg-terraform-01"
    version = "12.0"
    administrator_login = "admin123"
    administrator_login_password = "password@123"
    minimum_tls_version = "1.2"
    public_network_access_enabled = true
     
  }
}

sql_database_child = {
  db1 = {
    sql_data_name         = "terraform_sqldatabase"
    # server_id   = "/subscriptions/2a6429ab-34bc-4c09-812c-9e5d8ceee0d7/resourceGroups/rg_dev/providers/Microsoft.Sql/servers/sqlserver-dev-uday01"
    sql_server_name  = "terraform_sqlserver" 
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    resource_group_name = "rg-terraform-01"
  }
}

key_vault_child = {
  kv1 = {
    key_vault_name              = "kv-terraform-mahesh"
    resource_group_name         = "rg-terraform-01"
    location                    = "eastus"
    enabled_for_disk_encryption = true
    tenant_id                   = "4cdd4678-908a-4b16-946b-2f469301a974"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    tags = {
      env = "dev"
    }
  }
}
secrets = {
  secret1 = {
    key_vault_name      = "kv-terraform-mahesh"
    resource_group_name ="rg-terraform-01"
    secret_name         = "mahesh1983"
    secret_value        = "paasword@123"
  }
}
bastion_child = {
  bastion1 = {
    name                 = "bastion-dev-001"
    location             = "eastus"
    resource_group_name  = "rg-terraform-01"
    subnet_name          = "AzureBastionSubnet" 
    vnet_name            = "terraform_vnett1"
    pip_name             = "terraform_pip"
  }
}


