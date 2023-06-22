resource "aws_vpc" "myvpc" {
  cidr_block = "12.0.0.0/16"

  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "12.0.10.0/24"
  availability_zone       = var.subnet_az[0]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my_public_subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "12.0.20.0/24"
  availability_zone = var.subnet_az[0]

  tags = {
    Name = "my_private_subnet"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my_igw"
  }
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my_rt"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.my_rt.id
}

/*
resource "aws_route_table_association" "b" {
 subnet_id = aws_subnet.private.id
 route_table_id = aws_route_table.my_rt.id
} */