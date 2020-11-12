resource "linode_stackscript" "initial_config" {
  label = "initial_config"
  description = "basic setup"
  script = <<EOF
#!/bin/bash
# <UDF name="hostname" label="Set hostname" example="localhost" default="">
# <UDF name="username" label="Set username" example="admin" default="">
# <UDF name="pubkey" label="Set username" example="asdf" default="">
hostnamectl set-hostname $HOSTNAME

yum install -y curl python sudo

id -u $USERNAME || useradd -m -s /bin/bash $USERNAME
groups $USERNAME | grep -q sudo || usermod -a -G sudo $USERNAME
[ -f /etc/sudoers.d/$USERNAME ] || echo $USERNAME ALL = NOPASSWD : ALL > /etc/sudoers.d/$USERNAME
[ -d /home/$USERNAME/.ssh ] || mkdir /home/$USERNAME/.ssh
[ -f /home/$USERNAME/.ssh/authorized_keys ] || echo "$PUBKEY" > /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys
EOF
  images = [ var.image ]
  rev_note = "initial version"
}
