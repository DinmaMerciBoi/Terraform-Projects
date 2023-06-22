resource "aws_instance" "db" {
  ami = data.aws_ami.RHELinux.id
  instance_type = "t2.micro"
    
  tags = {
    Name = "DB_Server"
  }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}
