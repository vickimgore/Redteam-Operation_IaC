#! /bin/bash

cat <<EOF
all:
  vars:
    username: $USERNAME
    ansible_ssh_user: $USERNAME
    ansible_private_key_file: $SSH_PRIVKEY
    workdir: $WORKDIR
  children:
    cc:
      hosts:
        $HOST_IP
EOF
