terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  
  features {}
  subscription_id = "ecb756c6-dacc-42f6-96e3-ec8ed8ea07af"
  client_id       = "fa3a2524-6add-46c6-911b-29f231723c48"
  tenant_id       = "9cd12afa-d8fb-4e3c-b5e4-dd7765ae3876"
  client_secret   = "p5t8Q~a4Liwszc7euAfqxt8JIWdVhMN634k5odiw"

}

resource "azurerm_resource_group" "rg1" {
  name = "${var.rgname}"
  location = "${var.rglocation}"
  
}

resource "azurerm_virtual_network" "example" {
    name = "${var.vnet_name}"
    address_space = "${var.vnet_address_space}"
    location =  azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "example" {
    name = "${var.subnet_name}"
    resource_group_name = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_resource_group.example.name
    address_prefixes = "${var.subnet_address_prefix}"
  
}