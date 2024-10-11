# Create S3 Bucket

resource "aws_s3_bucket" "s3" {
  bucket = "abdeltawab-s3"
  force_destroy = true

  tags = {
    Name = "s3-main"
  }
}

# Create IAM Role 
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_policy" {
  name   = "s3_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::cloudkode1-s3",
          "arn:aws:s3:::cloudkode1-s3/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

# Attach IAM Role to EC2 Instances
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}

# Generate a new key pair for the jumper to access private instances
resource "tls_private_key" "jumper_to_private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "jumper_to_private_key_pair" {
  key_name   = "jumper-to-private-key"
  public_key = tls_private_key.jumper_to_private_key.public_key_openssh
}

resource "aws_key_pair" "abdo" {
  key_name   = "abdo-key"
  public_key = "ssh-rsa >>>>>"
}