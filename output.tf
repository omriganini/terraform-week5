output "web_admin_pass" {
  value = module.virtual_machines[*].admin_pass
}
output "database_admin_pass" {
  value = module.database.admin_pass
}