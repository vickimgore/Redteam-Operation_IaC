resource "linode_domain" "c2_00" {
    domain = var.DOMAIN
    soa_email = var.soa_email
    type = "master"
    ttl_sec     = 300
 }
# www.example.org
resource "linode_domain_record" "c2_01" {
    domain_id = linode_domain.c2_00.id
    name = "www"
    record_type = "A"
    ttl_sec     = 300
    target = linode_instance.c2.ip_address
}
# example.org
resource "linode_domain_record" "c2_02" {
    domain_id = linode_domain.c2_00.id
    name = var.DOMAIN
    record_type = "A"
    ttl_sec     = 300
    target = linode_instance.c2.ip_address
}
