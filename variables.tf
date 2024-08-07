variable "rgname" {
    type = string
    description = "Describes the resource of Azure Service"
  
}

variable "rglocation" {
    type = string
    description = "used for assigning the location"
    default = "eastus"
}

variable "vnet_name" {
    description = "The name of the Virtual Network"
    type = string
    default = "example-vnet"  
}

variable "vnet_address_space" {
     description = "The address space for the Virtual Network."
     type = list(string)
     default = ["10.0.0.0/16"]

}

variable "subnet_name" {
    description = "The name of the Subnet."
    type = string 
    default = "example-subnet" 
}

variable "subnet_address_prefix" {
    description = "The address prefix for the Subnet"
    type = list(string)
    default = [ "10.0.1.0/24" ]
  
}