resource "aws_vpc" "my_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = "${var.vpc_enable_dns}"

  tags = {
    Name = "My VPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "${var.subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My VPC - Internet Gateway"
  }
}

resource "aws_route_table" "my_vpc_us_east_1a_public" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_vpc_igw.id
    }

    tags = {
        Name = "Public Subnet Route Table."
    }
}

resource "aws_route_table_association" "my_vpc_us_east_1a_public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.my_vpc_us_east_1a_public.id
}

resource "aws_security_group" "sg" {
  name        = "allow_sg"
  description = "Allow SSH inbound connections"
  vpc_id = aws_vpc.my_vpc.id
  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = local.egress_rules
    content {
         from_port   = egress.value.port
         to_port     = egress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "allow_ssh_sg"
  }
}

locals {
  ingress_rules= [
    {port=54
    description=" data for port 54"},
    {port=23
    description="data for port 23"}
  ]
  egress_rules=[
    {port=32
    description=" data for port 32"},
    {port=43
    description="data for port 43"}
  ]
}
