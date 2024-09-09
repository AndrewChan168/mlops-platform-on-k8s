provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./vpc_module"

    vpc_cidr_block = "10.0.0.0/16"  
    public_subnet_cidr = "10.0.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
    vpc_name = "K8S-vpc"
    public_subnet_name = "K8S-public-subnet"
    private_subnet_name = "K8S-private-subnet"
    igw_name = "K8S-igw"
    nat_gateway_name = "K8S-nat-gateway"
    public_route_table_name = "K8S-public-route-table"
    private_route_table_name = "K8S-private-route-table"
}
