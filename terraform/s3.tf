resource "aws_s3_bucket" "terraform_state" {
  bucket = "cursodevops-terraform-state-bucket-kf"
 
  #Prevenir que se destruya el s3
  lifecycle {
    prevent_destroy = true
  }
}

#Añadir versionamiento al s3, cada vez que cambie el state file, se crea uno nuevo
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

#Añadir encriptacion al s3
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#Evitar que puedan ser leidos publicamente los archivos
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}