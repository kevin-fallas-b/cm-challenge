locals {
  remote_user = "ubuntu"
  ssh_private_key = file("/challenge-proyecto.pem")
}