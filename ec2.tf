provider "aws" {
  access_key = "AKIAVWCRJNBRPTZTS75J"
  secret_key = "8RFx4UU/7gtTeNqQCerRKhiuNkRbpZQ0A9TlwZ2r"
  region     = "us-east-1"
}
resource "aws_instance" "example"{
  ami           = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  }
