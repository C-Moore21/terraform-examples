# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami           = "ami-07d0cf3af28718ef8"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

