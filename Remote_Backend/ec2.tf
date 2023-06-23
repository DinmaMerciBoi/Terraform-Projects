resource "aws_instance" "db" {
  ami           = data.aws_ami.RHELinux.id
  instance_type = var.my_instance_type

  tags = {
    Name = "My_Server"
  }
}