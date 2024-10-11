# Create Auto Scaling Group

resource "aws_launch_configuration" "app" {
  name          = "app-launch-configuration"
  image_id      = "ami-097c5c21a18dc59ea"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.jumper_to_private_key_pair.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  security_groups      = [aws_security_group.SG_SSH_HTTP]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3
              echo "Hello, World from ASG" > /home/ec2-user/index.html
              cd /home/ec2-user
              python3 -m http.server 80 &
              EOF
}

resource "aws_autoscaling_group" "app" {
  launch_configuration = aws_launch_configuration.app.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.sub_prvi_1.id, aws_subnet.sub_prvi_2.id ]

  target_group_arns = [aws_lb_target_group.tg_lb.arn ]

  tag {
    key                 = "Name"
    value               = "ASG_Instance"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [desired_capacity]  
  }
}