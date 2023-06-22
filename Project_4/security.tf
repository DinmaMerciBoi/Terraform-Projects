# Create Security Group - SSH Traffic and other ports
resource "aws_security_group" "web-traffic" {
  name = "My_Security_Group"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Name" = "My_SG"
  }
}


resource "aws_security_group" "k8s-traffic" {
  name = "My_Security_Group1"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules2
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "UDP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


