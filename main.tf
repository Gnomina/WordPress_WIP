provider "aws" {
  region                 = "eu-central-1"
}

data "external" "git-branch" {
  program = ["bash", "-c", "echo '{\"branch\":\"'$(git rev-parse --abbrev-ref HEAD)'\"}'"]
}

resource "aws_instance" "example" {
  ami           = "ami-0d5095d28a904a729"
  instance_type = "t2.micro"
  key_name      = "WebAcademy_SSH_Key"

  provisioner "local-exec" {
    command = "echo 'Branch-${data.external.git-branch.result.branch}-Commit-'$(git rev-parse --short HEAD)"
    environment = {
      BRANCH = data.external.git-branch.result.branch
    }
    on_failure = ["echo Failure: $BRANCH"]
  }

  tags = {
    "Name" = "Branch-${data.external.git-branch.result.branch}-Commit-${chomp(`git rev-parse --short HEAD`)}"
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