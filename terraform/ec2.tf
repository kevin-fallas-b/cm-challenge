resource "aws_instance" "ec2-pagina-web" {
  # Block body
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.key_pair_name
  
  tags = {
    "Name" = "ec2-pagina-web"
  }
}


output "instance_ips" {
  value = [for i in aws_instance.ec2[*] : i.public_ip]
}