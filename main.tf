# ------------ Resource group ------------
resource "azurerm_resource_group" "rg" {
  name     = "webApp-terraform"
  location = "australiaeast"
}

module "net" {
  source = "./modules/network"

  instances_tags = var.instances_tags
  # VNet
  virtual_network_name = "VNet"
  rg_name              = azurerm_resource_group.rg.name
  cloud_location       = azurerm_resource_group.rg.location
  virtual_network_CIDR = var.virtual_network_CIDR

  # public subnet
  public_subnet_name = var.public_subnet_name
  public_subnet_CIDR = var.public_subnet_CIDR

  # NSG public
  public_NSG_name = var.public_NSG_name

  # private subnet
  private_subnet_name = var.private_subnet_name
  private_subnet_CIDR = var.private_subnet_CIDR

  # database NSG
  private_NSG_name = var.private_NSG_name

  # publiic IP load balancer
  public_ip_to_front_LB_name = var.public_ip_to_front_LB_name

  # availabilty set
  ava_set_name = var.ava_set_name

}

# create the virtual machine
module "virtual_machines" {
  source                = "./modules/vm"
  count                 = 3
  VM_name               = "vm-${count.index}"
  rg_name               = azurerm_resource_group.rg.name
  cloud_location        = azurerm_resource_group.rg.location
  vm_size               = "Standard_B2ms"
  user_name             = "omriganini"
  admin_pass            = var.admin_pass
  disable_password_auth = false
  nic_id                = [element(module.net.nic_id, count.index)]
  availability_id       = module.net.availabilty_set_id


  # OS_disk
  disk_caching              = "ReadWrite"
  disk_storage_account_type = "Standard_LRS"

  # source_image_reference
  os_source_image_publisher = "Canonical"
  os_source_image_offer     = "UbuntuServer"
  os_source_image_sku       = "18.04-LTS"
  os_source_image_version   = "latest"

}

module "database" {
  source = "./modules/vm"

  VM_name               = "vm-database"
  rg_name               = azurerm_resource_group.rg.name
  cloud_location        = azurerm_resource_group.rg.location
  vm_size               = "Standard_B2ms"
  user_name             = "omriganini"
  admin_pass            = var.admin_pass
  disable_password_auth = false
  nic_id                = module.net.database_nic_id
  availability_id       = null


  # OS_disk
  disk_caching              = "ReadWrite"
  disk_storage_account_type = "Standard_LRS"

  # source_image_reference
  os_source_image_publisher = "Canonical"
  os_source_image_offer     = "UbuntuServer"
  os_source_image_sku       = "18.04-LTS"
  os_source_image_version   = "latest"

}
