terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
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
    git_commit           = "538f8b9cfe37c00e298989bf1de581d8a6dddc6d"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-14 02:15:31"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PANW-Learning"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "025cab13-9b17-4e95-89b7-2c7682a4abe0"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name      = "DriftDetectionAppServerInstance"
    yor_trace = "642177c2-e1d8-49cc-88f7-0e2042a3247a"
  }
}
