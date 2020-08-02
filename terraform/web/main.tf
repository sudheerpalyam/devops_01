provider "aws" {
    region = "ap-southeast-2"
}

variable "name" {
    description="Name of the web box at apply"
}

resource "aws_instance" "do_web_01" {
    ami = "ami-02769748522663066"
    instance_type = "t2.micro"
    key_name = "devops_01"
    security_groups = [ "WebDMZ" ]

    tags = {
        Name = "${var.name}"
        CreatedBy = "terraform"
    }
}