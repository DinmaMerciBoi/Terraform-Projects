resource "aws_instance" "web" {
  ami = data.aws_ami.RHELinux.id
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data = file("./web/server-script.sh")
  key_name = var.my_key
    
  tags = {
    Name = "Web_Server"
  }
}

variable "my_key" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "OhioKey"
}

output "pub_ip" {
    value = module.eip.PublicIP
}

module "eip" {
    source = "../eip" 
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../sg"
}
