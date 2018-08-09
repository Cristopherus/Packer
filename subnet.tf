resource "aws_subnet" "public_subnet" {
  vpc_id     = "${aws_vpc.cristopherus_vpc.id}"
  cidr_block = "${var.cidr_subnet_public}"

  tags {
    Name = "Cristopherus Public Subnet"
  }

  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}
