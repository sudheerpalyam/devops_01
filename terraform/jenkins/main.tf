provider "aws" {
    region = "ap-southeast-2"
}

variable "name" {
    description = "Name the instance on deploy"
}

resource "aws_instance" "devops_01" {
    ami = "ami-02769748522663066"
    instance_type = "t2.micro"
    key_name = "devops_01"
    security_groups = [ "WebDMZ" ]

    tags = {
        Name = "${var.name}",
        CreatedBy = "terraform"
    }
}
