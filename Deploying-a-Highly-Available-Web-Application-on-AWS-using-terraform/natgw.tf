# create eip
resource "aws_eip" "eip" {
  tags = {
    Name = "eip"
  }
}

# create NatGateway

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.sub_pub_2.id

  tags = {
    Name = "Natgw"
  }
}