resource "aws_instance" "MyServer" {
  ami = data.aws_ami.RHELinux.id
  # instance_type as a variable (uncomment the desired)
  #instance_type = var.my_instance_type
  # instance_type as a list variable
  instance_type = var.my_instance_type_list[0]
  # instance_type as a map variable
  #instance_type = var.my_instance_type_map["dev"]
  key_name                    = "mykey2"
  subnet_id                   = module.vpc.public_subnets[0]
  user_data                   = file("${path.module}/app1-install.sh")
  vpc_security_group_ids      = [aws_security_group.web-traffic.id]
  associate_public_ip_address = true

  count = 1

  tags = {
    "Name" = "MyServer-${count.index}"
  }
}

#For terraform import use
/*
resource "aws_instance" "Web" {
  ami           = "ami-01107263728f3bef4"
  instance_type = "t2.micro"
  key_name               = "mykey2"
  vpc_security_group_ids = [aws_security_group.web-traffic.id]

  tags = {
    "Name" = "Our_Server"
  }
} */
