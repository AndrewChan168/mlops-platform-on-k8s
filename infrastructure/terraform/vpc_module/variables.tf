variable "vpc_cidr_block" {
  description   = "CIDR block for VPC"
  type          = string
}

variable "public_subnet_cidr" {
  description   = "CIDR block for public subnet"
  type          = string
}

variable "private_subnet_cidr" {
  description   = "CIDR block for private subnet"
  type          = string
}

variable "vpc_name" {
  description   = "Name for VPC"
  type          = string
}

variable "public_subnet_name" {
  description   = "Name for public subnet"
  type          = string 
}

variable "private_subnet_name" {
  description   = "Name for private subnet"
  type          = string 
}

variable "igw_name" {
  description   = "Name for internet gateway"
  type          = string 
}

variable "nat_gateway_name" {
  description   = "Name for NAT gateway"
  type          = string 
}

variable "public_route_table_name" {
  description   = "Name for Public Route table"
  type          = string 
}

variable "private_route_table_name" {
  description   = "Name for Private Route table"
  type          = string 
}