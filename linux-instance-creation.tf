provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAVIKIQAIRTXPQG34D"
  secret_key = "KwUcfKZPPpssV4dY3CNUdFrntNfW3SNGOD3vUDP1"
  region     = "ap-south-1"
}
resource "aws_instance" "example" {
  ami = "ami-0a5ac53f63249fba0"
  tags = {
    Name = "Linux-instance"
  }
  instance_type   = "t2.micro"
  key_name        = "terraform-windows"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh traffic"

  ingress {
    from_port = 22 # by default, linux server listens to TCP port 22 for SSH
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

