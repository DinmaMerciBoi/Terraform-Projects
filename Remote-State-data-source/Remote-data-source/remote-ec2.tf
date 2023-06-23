terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
  # Provider Block
provider "aws" {
    region  = "us-east-2"
  }

/*
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-terraformstate-dinma-buc"
    key    = "terraform/terraform.tfstate"
    region = "us-east-2"
  }
} */


data "terraform_remote_state" "network" {
  backend = "local"
  config = {
      path    = "../../Remote-State-data-source/terraform.tfstate"
  }
} 

resource "aws_instance" "my-ec2"{
  ami = data.aws_ami.RHELinux.id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.network.outputs.public_subnets[0]

  tags = {
    "Name" = "My_ec2"
  }
}
