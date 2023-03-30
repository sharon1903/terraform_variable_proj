#Configure VPC
resource "aws_vpc" "Tenacity_IT" {
  cidr_block       = var.Vpc_cidr
  instance_tenancy = var.Instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "Tenacity_IT"
  }
}

#Creating public subnets 
resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id     = aws_vpc.Tenacity_IT.id
  cidr_block = var.Prod-pub-sub1

  tags = {
    Name = "Prod-pub-sub1"
  }
}

resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id     = aws_vpc.Tenacity_IT.id
  cidr_block = var.Prod-pub-sub2

  tags = {
    Name = "Prod-pub-sub2"
  }
}

#Creating private subnets
resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id     = aws_vpc.Tenacity_IT.id
  cidr_block = var.Prod-priv-sub1

  tags = {
    Name = "Prod-priv-sub1"
  }
}

resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id     = aws_vpc.Tenacity_IT.id
  cidr_block = var.Prod-priv-sub2

  tags = {
    Name = "Prod-priv-sub2"
  }
}

#Creating public route table 
resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.Tenacity_IT.id
}

#Creating private route table 
resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.Tenacity_IT.id
}

#Associating public subnet 1 to route table 
resource "aws_route_table_association" "Prod_pub_subnet1_route_table_association" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

#Associating public subnet 2 to route table 
resource "aws_route_table_association" "Prod_pub_subnet2_route_table_association" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

#Associating private subnet 1 to route table 
resource "aws_route_table_association" "Prod_priv_subnet1_route_table_association" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

#Associating private subnet 2 to route table 
resource "aws_route_table_association" "Prod_priv_subnet2_route_table_association" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

#Creating internet gateway
resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.Tenacity_IT.id

  tags = {
    Name = "Prod-igw"
  }
}

#Associate the internet gateway with the public route table
resource "aws_route_table_association" "Prod-igw-association" {
  gateway_id     = aws_internet_gateway.Prod-igw.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

#Creating EC2 instance1
resource "aws_instance" "Rock-server-1" {
  ami                     = var.Instance_ami
  instance_type           = var.Instance_type
  subnet_id   = aws_subnet.Prod-pub-sub1.id
  
}

#Creating EC2 instance2
resource "aws_instance" "Rock-server-2" {
  ami                     = var.Instance_ami
  instance_type           = var.Instance_type
  subnet_id   = aws_subnet.Prod-priv-sub1.id
  
}

