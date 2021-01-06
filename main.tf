provider "aws" {
    region = var.AWS_REGION
    profile = "list"
}

resource "aws_instance" "ec2_instance" {
    ami = var.AMI
    key_name = "aws"
    instance_type = "t2.micro"
    tags = {Name = "Jen-Ter-Ans-server"}
}
