resource "aws_vpc" "k8s_vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
        name = "K8S-VPC"
    }
}

resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.k8s_vpc.id
    cidr_block              = var.public_subnet_cidr
    map_public_ip_on_launch = true

    tags = {
        name = var.public_subnet_name
    }
}

resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.k8s_vpc.id
    cidr_block              = var.private_subnet_cidr
    map_public_ip_on_launch = true

    tags = {
        name = var.private_subnet_name
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.k8s_vpc.id

    tags = {
        name = var.igw_name
    }
}

resource "aws_eip" "eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
    allocation_id   = aws_eip.eip.id
    subnet_id       = aws_subnet.public.id

    tags = {
        name = var.nat_gateway_name
    }
}

// Route table section
resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.k8s_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        #name = "K8S-public-route-table"
        name = var.public_route_table_name
    }
}

resource "aws_route_table_association" "public_assoc_route" {
    subnet_id       = aws_subnet.public.id
    route_table_id  = aws_route_table.public_route.id
}

resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.k8s_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        #name = "K8S-private-route-table"
        name = var.private_route_table_name
    }
}

resource "aws_route_table_association" "private_assoc_route" {
    subnet_id       = aws_subnet.private.id
    route_table_id  = aws_route_table.private_route.id
}