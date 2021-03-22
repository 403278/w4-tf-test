terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Configure the Resources
resource "aws_instance" "web" {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  key_name      = "SASadminKP-ID"
  security_groups = ["SSH to Ansible Control Node"]

  tags = {
    Name = "W4_Webhost"
  }
}

# Configure the Output
output "publicIp" {
  value = aws_instance.web.public_ip
}