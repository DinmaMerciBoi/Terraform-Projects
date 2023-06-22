provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "Terra-test" {
  ami           = "ami-067a8829f9ae24c1c"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Terra-Test"
  }
}

resource "aws_vpc" "FirstVPC" {
  cidr_block = "192.168.0.0/24"
  tags = {
    "Name" = "FirstVPC"
  }
}