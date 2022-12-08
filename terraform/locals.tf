locals {
  remote_user = "ubuntu"
  ssh_private_key = file("/home/ubuntu/.ssh/id_rsa")
}