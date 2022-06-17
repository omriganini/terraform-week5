output "web_admin_pass" {
  value = module.virtual_machines[*].admin_pass
}
