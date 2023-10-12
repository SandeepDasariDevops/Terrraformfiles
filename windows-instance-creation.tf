provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAVIKIQAIRTXPQG34D"
  secret_key = "KwUcfKZPPpssV4dY3CNUdFrntNfW3SNGOD3vUDP1"
  region     = "ap-south-1"
}
resource "aws_instance" "example" {
  ami = "ami-08abb3eeacc61972d"
  tags = {
    Name = "windows-instance"
  }
  instance_type   = "t2.micro"
  key_name        = "terraform-windows"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
}
resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "allow rdp traffic"

  ingress {
    from_port = 3389 # by default, windows server listens to TCP port 3389 for RDP
    to_port   = 3389
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
