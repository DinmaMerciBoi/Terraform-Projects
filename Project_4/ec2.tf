resource "aws_instance" "MyServer" {
  ami = data.aws_ami.RHELinux.id
  # instance_type as a variable (uncomment the desired)
  #instance_type = var.my_instance_type
  # instance_type as a list variable
  #instance_type = var.my_instance_type_list[0]
  # instance_type as a map variable
  instance_type          = var.my_instance_type_map["dev"]
  key_name               = var.my_key
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.web-traffic.id, aws_security_group.k8s-traffic.id]
  count                  = 2

  tags = {
    "Name" = "MyServer-${count.index}"
  }
}
