provider "aws"{
    region = "ap-south-1"
}

variable "vpc_cidr" {
    type = list(string)
    description = "multiple cidrs"
    default = ["10.0.0.0/16","11.0.0.0/16","12.0.0.0/16"]  
}

resource "aws_vpc" "my-test-vpc"{
    count = length(var.vpc_cidr)
    cidr_block = element(var.vpc_cidr,count.index)  

    tags = {
        Name = "demo-vpc-${count.index}"
    }
}