resource "aws_instance" "MyServer" {
  ami                    = data.aws_ami.RHELinux.id
  instance_type          = var.my_instance_type
  key_name               = var.my_key
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  tags = {
    "Name" = "MyServer"
  }
}
