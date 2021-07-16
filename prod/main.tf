provider "aws" {
  region                  = "ap-south-1"
  profile                 = "rahul"
}

module "my_vpc" {
    source = "../modules/vpc"
    vpc_cidr = "192.168.0.0/16"
    tenancy = "default"
    vpc_id = "${module.my_vpc.vpc_id}"
    subnet_cidr = "192.168.1.0/24"

}

module "my_ec2" {
    source = "../modules/ec2"
    ami_id = "ami-00bf4ae5a7909786c"
    ec2_count = 1
    instance_type = "t2.micro"
    subnet_id = "${module.my_vpc.subnet_id}"
}