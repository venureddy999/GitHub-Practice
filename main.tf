#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    access_key = "AKIA4WSPHBOJ7Y5P7TG5"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_vpc" "default" {
    cidr_block = "10.10.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "DevOps-VPC"
	Owner = "Venu Reddy"
	Environment = "DevOps_Lab"
	    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
    	tags = {
        Name = "DevOps_VPC_IGW"
        Environment = "DevOps_Lab"
    }
}

resource "aws_subnet" "subnet1-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "DevOps_VPC_Subnet-1"
        Environment = "DevOps_Lab"
    }
}

resource "aws_subnet" "subnet2-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.2.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "DevOps_VPC_Subnet-2"
        Environment = "DevOps_Lab"
    }
}

resource "aws_subnet" "subnet3-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.3.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "DevOps_VPC_Subnet-3"
        Environment = "DevOps_Lab"
    }
}

