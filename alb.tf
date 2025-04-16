resource "aws_lb" "ec2-alb" {
  name               = "ec2-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_rules.id]
  subnets            = [aws_subnet.public1.id,aws_subnet.public2.id]
}