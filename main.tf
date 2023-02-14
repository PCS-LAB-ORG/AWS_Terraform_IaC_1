terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_security_group" "Ec2_security1" {
  name        = "TerraformEc2_security1"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-05ae32088bccb6d55"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {

    yor_trace = "485cce8f-9a3c-4fa9-b931-67bc1d1af005"
  }
}

resource "aws_instance" "Prisma_Cloud_demo_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {

    yor_trace = "2093a50c-3688-4a74-81a4-71160cf7095c"
  }
}
