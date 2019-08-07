locals {

  user_data = <<EOF
    #cloud-config
    runcmd:
    - sudo apt-get update -y
    - apt-get install nginx -y
  EOF
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-07d0cf3af28718ef8"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.sg.name}"]
  user_data     = "${local.user_data}"

  tags = {
    Name = "HelloWorld.${count.index}"
  }
}

resource "aws_eip" "bar" {
  count          = 2
  vpc            = true
  instance       = "${aws_instance.web[count.index].id}"
}
