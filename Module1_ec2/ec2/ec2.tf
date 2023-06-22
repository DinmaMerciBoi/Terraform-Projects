resource "aws_instance" "ec2" {
  ami = data.aws_ami.RHELinux.id
  instance_type = var.my_instance_type
    
  tags = {
    "Name" = var.ec2name
  }
}
