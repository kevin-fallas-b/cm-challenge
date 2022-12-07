variable "ami-id" {
    type            = string
    description     = "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type"
    default         = "ami-08c40ec9ead489470"
}

variable "instance-type" {
    type           = string
    description    = "Tamaño de la EC2"
    default        = "t2.micro"
}  

variable "key_pair_name" {
    type          = string
    description   = "Key pair created in aws.com"
    default       = "challenge-proyecto"
}