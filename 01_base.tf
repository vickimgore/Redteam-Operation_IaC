provider "linode" {
    token = var.linode_token
}

resource "linode_sshkey" "keys" {
    label = "myssh"
    ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
}

resource "random_password" "root_password" {
    length  = 32
    special = true
}

resource "linode_instance" "c2" {
    image = var.image
    label = var.label
    region = var.region
    type = var.type
    authorized_keys = [ linode_sshkey.keys.ssh_key ]
    root_pass = random_password.root_password.result

    stackscript_id = linode_stackscript.initial_config.id
    stackscript_data = {
      "hostname" = var.hostname
      "username" = var.username
      "pubkey"   = linode_sshkey.keys.ssh_key
    }
}
