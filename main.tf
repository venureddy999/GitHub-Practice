#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    access_key = "AKIATVCTEMCTUZMK5WXV"
    secret_key = "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"
    region = "us-east-1"
}

#terraform {
#  backend "s3" {
#    bucket = "venuterraformbucket"
#    key    = "DevOps.tfstate"
#    region = "us-east-1"
#  }
#}

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

resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
    tags = {
        Name = "DevOps_VPC_RT"
    }
}
