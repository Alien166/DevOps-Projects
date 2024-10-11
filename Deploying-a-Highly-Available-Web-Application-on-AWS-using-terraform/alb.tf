# create Applicarion load balancer

resource "aws_lb" "lb" {
  name               = "lb-main"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG_SSH_HTTP.id]
  subnets            = [aws_subnet.sub_pub_1.id , aws_subnet.sub_pub_2.id ]
  enable_deletion_protection = false



  tags = {
    Environment = "alb"
  }
}


# create target group for alb

resource "aws_lb_target_group" "tg_lb" {
  name     = "tg-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    protocol = "HTTP"
    path = "/"
  }

  tags = {
    Name = "target_group"
  }
}


# create lb_listener for load balancer  

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.listener.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.listener.arn
  }
}