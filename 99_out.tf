output "ip_address" {
  value = linode_instance.c2.*.ip_address
}

output "root_password" {
  value = random_password.root_password.result
}
