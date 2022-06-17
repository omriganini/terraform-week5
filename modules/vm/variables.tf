variable "rg_name" {
  type        = string
  description = "resource group name"
}
variable "cloud_location" {
  type        = string
  description = "resource location"
}

variable "VM_name" {
  type        = string
  description = "vm name"
}

variable "vm_size" {
  type        = string
  description = "virtual machine size"
}
variable "user_name" {
  type        = string
  description = "User name"
}

# disk
variable "disk_caching" {
  type        = string
  description = "Disk caching"
}
variable "disk_storage_account_type" {
  type        = string
  description = "Disk storage account type"
}
variable "admin_pass" {
  type        = string
  description = "User password"
}

# source image reference
variable "os_source_image_publisher" {
  type        = string
  description = "image publisher"
}
variable "os_source_image_sku" {
  type        = string
  description = "image sku"
}
variable "os_source_image_offer" {
  type        = string
  description = "image offer"
}
variable "os_source_image_version" {
  type        = string
  description = "image version"
}
variable "availability_id" {
  description = "availability id"
}
variable "disable_password_auth" {
  type        = bool
  description = "disable_password_authentication"
}
variable "nic_id" {
  description = "nic id"
}