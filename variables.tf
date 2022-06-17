variable "rg_name" {
  type        = string
  description = "resource group name"
  default = "RG"
}
variable "cloud_location" {
  type        = string
  description = "resource location"
  default = "australiaeast"
}
variable "instances_tags" {
  default = "mytags"
  description = "Tags Owner and Part tags"
}

variable "virtual_network_CIDR" {
  type        = list(string)
  description = "virtual network address space"
  default = ["10.0.0.0/16"]
}
variable "virtual_network_name" {
  type        = string
  description = "Virtual Network name"
  default = "v-net"
}

variable "public_subnet_CIDR" {
  type        = list(string)
  description = "public subnet addr prefixs"
  default = ["10.0.1.0/24"]
}
variable "public_subnet_name" {
  type        = string
  description = "public subnet name"
  default = "pub-sub"
}
variable "private_subnet_name" {
  type        = string
  description = "private subnet name"
  default = "private-sub"
}
variable "private_subnet_CIDR" {
  type        = list(string)
  description = "private subnet addr prefixs"
  default = ["10.0.2.0/24"]
}

variable "public_NSG_name" {
  type        = string
  description = "Public NSG name"
  default = "nsg-public"
}
variable "private_NSG_name" {
  type        = string
  description = "private NSG name"
  default = "nsg-public"
}
# public IP
variable "public_ip_to_front_LB_name" {
  type        = string
  description = "public IP to front load balancer"
  default = "lb-pulic-ip"
}
# availabilty set
variable "ava_set_name" {
  type        = string
  description = "availability set name"
  default = "avset"
}

variable "admin_pass" {
  type        = string
  description = "User password"
}

