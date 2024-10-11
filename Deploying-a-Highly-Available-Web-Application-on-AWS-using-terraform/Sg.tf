# create security group to allow ssh and http
resource "aws_security_group" "SG" {
  vpc_id = aws_vpc.vpc.id


    # Add HTTP ingress rule
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add SSH ingress rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG_SSH_HTTP"
  }
}



# create security group to allow ssh 
resource "aws_security_group" "SG_Basition_Host" {
  vpc_id = aws_vpc.vpc.id

  # Add SSH ingress rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with a more restrictive CIDR if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG_Basition_Host"
  }
}