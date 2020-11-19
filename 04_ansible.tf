resource "null_resource" "setup" {
  depends_on = [ linode_stackscript.initial_config ]
  connection {
    host = linode_instance.c2.ip_address
    type = "ssh"
    user = var.username
    timeout = "120s"
    agent = false
    private_key = chomp(file("~/.ssh/id_rsa"))
  }
  provisioner "local-exec" {
    command = "if [ ! -d ./stagging ]; then mkdir stagging ; fi"
  }
}

resource "null_resource" "copyfiles" {
  depends_on = [ null_resource.setup ]

  provisioner "local-exec" {
    command = "sh ./scripts/genera-inventory.sh > ./stagging/ansible-inventory"

    environment = {
      USERNAME = var.username
      SSH_PRIVKEY = "~/.ssh/id_rsa"
      HOST_IP = linode_instance.c2.ip_address
      WORKDIR = var.WORKDIR
    }
  }

  provisioner "local-exec" {
    command = "./bin/python3.8 ./bin/ansible-playbook -i ./stagging/ansible-inventory ./ansible/cc.yml"

    environment = {
      ANSIBLE_DEBUG             = var.ANSIBLE_DEBUG
      ANSIBLE_CONFIG            = "./ansible/ansible.cfg"
      ANSIBLE_HOST_KEY_CHECKING = "False"
      ANSIBLE_SSH_RETRIES       =  7
    }
  }
}
