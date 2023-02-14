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

  resource "aws_instance" "Prisma_Cloud_demo_server" {
    ami           = "ami-830c94e3"
    instance_type = "t2.micro"
  }

  tags = {
    git_commit           = "71445995f37fa599ee3a177ff6c9391135e6bc63"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-13 23:48:00"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PANW-Learning"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "8f4f25dd-5e43-47a5-9642-66a99051b5db"
  }
}
