variable "region" {
  type    = string
  default = "us-east-2"
}
/*
variable "my_ami"{
  type = string
  default = "ami-0e0bf4b3a0c0e0adc"
} */

# Instance Type (uncomment the desired)
# Instance type as a variable
variable "my_instance_type" {
  type    = string
  default = "t2.micro"
}

# Instance type as a list variable
variable "my_instance_type_list" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t2.micro", "t2.medium", "t3.large"]
}

# Instance type as a map variable
variable "my_instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t2.medium"
    "prod" = "t3.large"
  }
}

variable "my_key" {
  description = "AWS EC2 Key pair that needs to be associated with EC2 Instance"
  type        = string
  default     = "OhioKey"
}

variable "ingressrules" {
  type    = list(number)
  default = [22, 80, 443, 8080]
}

variable "egressrules" {
  type    = list(number)
  default = [25, 80, 443, 8080, 3306, 53]
}
