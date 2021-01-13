#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    access_key = "AKIA4WSPHBOJ7Y5P7TG5"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_vpc" "default" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "DevOps-VPC"
	Owner = "Venu"
	    }
}