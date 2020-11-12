variable "linode_token" {
  description = "Linode API Personal Access Token"
}

variable "image" {
  description = "Image to use for Linode instance"
  default = "linode/centos7"
}

variable "label" {
  description = "The Linode's label is for display purposes only."
  default = "default-linode"
}

variable "region" {
  description = "The region where your Linode will be located."
  default = "us-east"
}

variable "type" {
  description = "Your Linode's plan type."
  default = "g6-standard-1"
}

variable "soa_email" {
  description = "Start of Authority email address. This is required for master domains."
}

variable "username" {
  description = "My username"
}

variable "ANSIBLE_DEBUG" {
  description = "Enable Ansible debug"
}

variable "hostname" {
  description = "local hostname"
}

variable "DOMAIN" {
  description = "The domain this domain represents."
}

variable "WORKDIR" {
  description = "Working dir"
}
