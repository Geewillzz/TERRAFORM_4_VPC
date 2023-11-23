resource "aws_vpc" "myvpc" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"

}

resource "aws_subnet" "mysubnet1" {
    vpc_id  = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone   = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "mysubnet2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block  = "10.0.1.0/24"
    availability_zone   = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "myigw" {
    vpc_id  = aws_vpc.myvpc.id

}

resource "aws_route_table" "myrt" {
    vpc_id  = aws_vpc.myvpc.id
}

