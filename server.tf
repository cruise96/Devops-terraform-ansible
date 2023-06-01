terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-05a36e1502605b4aa"
  instance_type = "t2.micro"
  key_name = "atharva-pub-key"
  security_groups = ["sg-03f8a5614564561ae"]

  tags = {
    Name = "aj-pipeline"
    env = "Production"
    owner = "Atharva J"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}


