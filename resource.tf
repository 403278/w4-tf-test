resource "aws_instance" "web" {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  key_name      = "AnsibleCN"
  security_groups = ["SSH to Ansible Control Node"]

  tags = {
    Name = "W4_Webhost"
  }
}