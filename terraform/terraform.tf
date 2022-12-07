terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }

  backend "s3" {
    bucket         =  "cursodevops-terraform-state-bucket-kf"
    key            = "global/s3/terraform.tfstate"
  }
}