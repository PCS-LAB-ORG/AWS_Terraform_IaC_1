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
    git_commit           = "538f8b9cfe37c00e298989bf1de581d8a6dddc6d"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-14 02:15:31"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PCS-LAB-ORG"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "2ba9f1ad-49eb-4c9a-8c03-0cd718ec2475"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name                 = "DriftDetectionAppServerInstance"
    git_commit           = "119dedd740418ec194d137e98b6e10fada7fad18"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-14 02:11:06"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PCS-LAB-ORG"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "ee29a7c8-bf8b-46c5-bf87-dabb52eca4ca"
  }
}
