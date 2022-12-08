resource "aws_instance" "nginx" {
  # Block body
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.key_pair_name
  
  tags = {
    "Name" = "ec2-pagina-web"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = local.remote_user
      password = local.ssh_private_key
      host     = self.public_ip
   }

  }

  #Call ansible
  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.public_ip} --private-key ${local.ssh_private_key}  ../ansible/install-nginx.yaml"
  }

}