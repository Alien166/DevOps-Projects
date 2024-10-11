resource "aws_instance" "Basition_Host" {
  ami = "ami-097c5c21a18dc59ea"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub_pub_1.id
  vpc_security_group_ids = [aws_security_group.SG_Basition_Host.id]
  associate_public_ip_address = true 
  key_name = aws_key_pair.abdo.key_name

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/ec2-user/.ssh
              echo '${tls_private_key.jumper_to_private_key.private_key_pem}' > /home/ec2-user/.ssh/jumper_to_private_key.pem
              chmod 600 /home/ec2-user/.ssh/jumper_to_private_key.pem
              chown ec2-user:ec2-user /home/ec2-user/.ssh/jumper_to_private_key.pem
              EOF

  tags = {
    Name = "jump server"
  }

  depends_on = [aws_security_group.SG_Basition_Host]
}