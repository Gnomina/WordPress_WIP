provider "aws" {
  region                 = "eu-central-1"
}

resource "aws_instance" "example"{
  ami                    = "ami-0d5095d28a904a729"
  instance_type          = "t2.micro"
  key_name               = "WebAcademy_SSH_Key"
  //tags                   = {"Name" = "Terraform"}
  
  provisioner "local-exec" {
    command = "git rev-parse --abbrev-ref HEAD"
    interpreter = ["bash", "-c"]
    environment = {
      BRANCH = ""
    }

    on_start = ["echo Setting environment variable BRANCH", "export BRANCH=$(git rev-parse --abbrev-ref HEAD)"]
    on_failure = ["echo Failure: $BRANCH"]
    on_success = ["echo Success: $BRANCH"]

    environment = {
      BRANCH = ""
    }
  }

  provisioner "local-exec" {
    command = "git rev-parse --short HEAD"
    interpreter = ["bash", "-c"]
    environment = {
      COMMIT = ""
    }

    on_start = ["echo Setting environment variable COMMIT", "export COMMIT=$(git rev-parse --short HEAD)"]
    on_failure = ["echo Failure: $COMMIT"]
    on_success = ["echo Success: $COMMIT"]

    environment = {
      COMMIT = ""
    }
  }

  tags = {
    "Name" = "Branch-${local-exec.git_rev_parse.env.BRANCH}-Commit-${local-exec.git_rev_parse.env.COMMIT}"
  }
  
  
  vpc_security_group_ids = ["sg-0a62d8f422094f3b6"]
}
output "instance_public_ip" {
  value = aws_instance.example.public_ip
 }
resource "null_resource" "save_instance_ip" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > instance_public_ip.txt"
    //command = "echo ${aws_instance.example.private_ip} >> instance_public_ip.txt"
  }
}

//output "instance_private_ip" {
//  value = aws_instance.example.private_ip
//}