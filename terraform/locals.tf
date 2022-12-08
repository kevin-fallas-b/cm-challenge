locals {
  remote_user = "ubuntu"
  ssh_private_key = file("/home/ubuntu/.ssh/challenge-proyecto.pem")
}