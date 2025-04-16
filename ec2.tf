resource "aws_instance" "demo1" {
  ami           = "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public1.id
  security_groups = [aws_security_group.sg_rules.id]
  associate_public_ip_address = true
  key_name                    = "din"
    user_data = <<-EOF
              #!/bin/bash
              mkfs -t xfs /dev/xvdf
              mkdir /dinesh
              mount /dev/xvdf /dinesh
              echo "/dev/xvdf /dinesh,nofail 0 2" >> /etc/fstab
              EOF

  
}


  