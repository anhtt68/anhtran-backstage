resource "aws_vpc" "backstage_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  for_each = toset(var.public_subnets)
  vpc_id = aws_vpc.backstage_vpc.id
  cidr_block = each.value
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private_subnets" {
  for_each = toset(var.private_subnets)
  vpc_id = aws_vpc.backstage_vpc.id
  cidr_block = each.value
  tags = {
    Name = "${var.project}-private-subnet-${each.key}"
  }
}


resource "aws_internet_gateway" "backstage_igw" {
  vpc_id = aws_vpc.backstage_vpc.id
  tags = {
    Name = "${var.project}-igw"
  }
}

resource "aws_route_table" "backstage_public_rtbl" {
  vpc_id = aws_vpc.backstage_vpc.id
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.backstage_igw.id
  }
  tags = {
    Name = "${var.project}-public-rtbl"
  }
}

resource "aws_route_table_association" "public_route"{
  for_each = aws_subnet.public_subnets
  subnet_id = each.value.id
  route_table_id = aws_route_table.backstage_public_rtbl.id
}