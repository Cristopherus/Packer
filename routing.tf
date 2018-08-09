data "aws_availability_zones" "available" {}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.cristopherus_vpc.id}"

  tags {
    Name = "Cristopherus Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.cristopherus_vpc.id}"

  tags {
    Name = "Cristopherus Public Route Table"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}
