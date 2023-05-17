provider "aws" {
  access_key = "AKIAUEP3PLHSRMTXTX7F"
  secret_key = "35s/aLj1FpxIWxj1gagiBH/OE8fLbYqnV73FUEdo"
  region     = "eu-central-1"
}

resource "aws_instance" "example"{
  ami                    = "ami-0d5095d28a904a729"
  instance_type          = "t2.micro"
  key_name               = "WebAcademy_SSH_Key"
  tags                   = {"Name" = "Terraform"}
  vpc_security_group_ids = ["sg-0a62d8f422094f3b6"]
}