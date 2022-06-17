# ------------ Virtual Machine ------------
resource "azurerm_linux_virtual_machine" "webAppWT" {
  name                            = var.VM_name
  resource_group_name             = var.rg_name
  location                        = var.cloud_location
  size                            = var.vm_size
  admin_username                  = var.user_name
  admin_password                  = var.admin_pass
  disable_password_authentication = var.disable_password_auth
  network_interface_ids           = var.nic_id
  availability_set_id             = var.availability_id


  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.disk_storage_account_type
  }

  source_image_reference {
    publisher = var.os_source_image_publisher
    offer     = var.os_source_image_offer
    sku       = var.os_source_image_sku
    version   = var.os_source_image_version
  }

}