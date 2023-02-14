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

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name                 = "ExampleAppServerInstance"
    git_commit           = "119dedd740418ec194d137e98b6e10fada7fad18"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-14 02:11:06"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "PANW-Learning"
    git_repo             = "AWS_Terraform_IaC_1"
    yor_trace            = "46504b3c-4c28-4217-9d3d-97189e111dc1"
  }
}
