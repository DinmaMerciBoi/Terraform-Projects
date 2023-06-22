resource "aws_instance" "MyServer" {
  ami           = "ami-067a8829f9ae24c1c"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/app1-install.sh")

  tags = {
    "Name" = "DBServer"
  }
}
