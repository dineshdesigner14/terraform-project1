# Security Group - Allow TLS (port 443,80,22)
resource "aws_security_group" "sg_rules" {
  name        = "sg_rules"
  description = "Allow inbound HTTPS traffic"
  vpc_id      = aws_vpc.main.id
  ingress {
    description = "HTTPS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol = "tcp"
    to_port     = 22

  }

}



