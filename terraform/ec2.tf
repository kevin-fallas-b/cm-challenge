resource "aws_instance" "nginx" {
  # Block body
  ami           = var.ami-id
  instance_type = var.instance-type
  
  key_name      = var.key_pair_name
  security_groups = [aws_security_group.nginx.name]
  
 
  provisioner "remote-exec" {
    inline = [
      "echo 'wait untill ssh is ready'"
    ]
    connection {
      type     = "ssh"
      user     = local.remote_user
      private_key = file(local.ssh_private_key)
      host     = self.public_ip
   }

  }

  #Call ansible
  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.public_ip} --private-key ${local.ssh_private_key}  ../ansible/install-nginx.yaml"
  }

  tags = {
    "Name" = "ec2-pagina-web"
  }

}