variable "client_id" {
  type = string
  default = "fa3a2524-6add-46c6-911b-29f231723c48"
}

variable "client_secret" {
  type = string
  default = "p5t8Q~a4Liwszc7euAfqxt8JIWdVhMN634k5odiw"
}

variable "tenant_id" {
  type = string
  default = "9cd12afa-d8fb-4e3c-b5e4-dd7765ae3876"
}

variable "subscription_id" {
  type = string
  default = "ecb756c6-dacc-42f6-96e3-ec8ed8ea07af"
}
variable "rgname" {
    type = string
    description = "Describes the resource of Azure Service"
  
}

variable "rglocation" {
    type = string
    description = "used for assigning the location"
    default = "eastus"
}
variable "server_name" {
    type = string
  
}


variable "storage_account_name" {
    type = string
  
}
variable "storage_tier" {
    type = string
    default = "Standard"
}
variable "storage_type" {
    type = string
  
}
variable "db_name" {
    type = string
  }