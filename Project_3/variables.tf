variable "region" {
  type    = string
  default = "us-east-2"
}

variable "my_ami" {
  type    = string
  default = "ami-0e0bf4b3a0c0e0adc"
}

variable "my_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "my_key" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
  default     = "OhioKey"
}