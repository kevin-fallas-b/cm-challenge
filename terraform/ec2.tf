resource "aws_instance" "ec2" {
  # Block body
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.key_pair_name
  user_data     = file("../scripts/initial-setup.sh")

  tags = {
    "Name" = "EC2 CI/CD"
  }
}