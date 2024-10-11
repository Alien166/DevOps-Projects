# craete public route table

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}


# create private route table

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-rt"
  }
}

#create the private route 
resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.natgw.id
}


# Associate Subnets with Route Tables

resource "aws_route_table_association" "pub-associate-1" {
  subnet_id = aws_subnet.sub_pub_1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "pub-associate-2" {
  subnet_id = aws_subnet.sub_pub_2.id 
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "prv-associate-1" {
  subnet_id = aws_subnet.sub_prvi_1
  route_table_id = aws_route_table.private-rt.id 
}

resource "aws_route_table_association" "prv-associate-2" {
  subnet_id = aws_subnet.sub_prvi_2.id 
  route_table_id = aws_route_table.private-rt.id 
}