resource "aws_subnet" "sub_pub_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pub1-cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name ="Pub-sub-1"
  }
}

resource "aws_subnet" "sub_pub_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pub2-cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name ="Pub-sub-2"
  }
}

resource "aws_subnet" "sub_prvi_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.prvi1-cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name ="Prv-sub-1"
  }
}

resource "aws_subnet" "sub_prvi_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.prvi2-cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name ="Prv-sub-2"
  }
}