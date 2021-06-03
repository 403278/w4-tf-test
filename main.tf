Create the VPC
 resource "aws_vpc" "CASpublicVPCu1" {                # Creating VPC here
   cidr_block       = var.CASpublicVPCu1_vpc_cidr     # Defining the CIDR block use 10.0.0.0/24 for demo
   instance_tenancy = "default"
 }
 Create Internet Gateway and attach it to VPC
 resource "aws_internet_gateway" "cas-igw-u1" {    # Creating Internet Gateway
    vpc_id =  aws_vpc.CASpublicVPCu1.id               # vpc_id will be generated after we create VPC
 }
 Create a Public Subnets.
 resource "aws_subnet" "u1-subnet" {    # Creating Public Subnets
   vpc_id =  aws_vpc.CASpublicVPCu1.id
   cidr_block = "${var.public_subnets}"        # CIDR block of public subnets
 }
 Route table for Public Subnet's
 resource "aws_route_table" "CASpubRTu1" {    # Creating RT for Public Subnet
    vpc_id =  aws_vpc.CASpublicVPCu1.id
         route {
    cidr_block = "0.0.0.0/0"               # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.cas-igw-u1.id
     }
 }
 Route table Association with Public Subnet's
 resource "aws_route_table_association" "CASpubRTu1association" {
    subnet_id = aws_subnet.u1-subnet.id
    route_table_id = aws_route_table.CASpubRTu1.id
 }