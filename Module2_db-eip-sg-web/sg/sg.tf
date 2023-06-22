variable "ingress" {
  type = list(number)
  default = [80,443]
}

variable "egress" {
  type = list(number)
  default = [80,443]
}

output "sg_name" {
    value = aws_security_group.web-traffic.name
}

# Create Security Group - SSH Traffic and other ports
resource "aws_security_group" "web-traffic" {
  name        = "My_Security_Group"
  
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

