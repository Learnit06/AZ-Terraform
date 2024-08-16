# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=3.0.0"
#     }
#   }
# }


module "Cosmo" {
    source = "./module_sql"
    client_id = var.client_id
    client_secret = var.client_secret
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    rglocation = "EastUS"
    rgname = "CosmoGRP"
    storage_account_name = "cosmostorage"
    storage_tier = "Standard"
    storage_type = "LRS"
    server_name = "cosmoserver"
    db_name = "Cosmosdb1"
  
}

