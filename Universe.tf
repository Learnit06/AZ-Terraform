# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=3.0.0"
#     }
#   }
# }


module "Univ" {
    source = "./module_sql"
    rglocation = "EastUS"
    rgname = "UnivGRP"
    storage_account_name = "univstorage"
    storage_tier = "Standard"
    storage_type = "LRS"
    server_name = "univserver"
    db_name = "univDB"
  
}