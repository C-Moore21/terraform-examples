resource "aws_security_group" "sg" {
  description = "Test SG"
  name        = "security-group-main"

}

resource "aws_security_group_rule" "allow-http-ingress" {
  type              = "ingress"
  security_group_id = "${aws_security_group.sg.id}"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-all-outbound" {
  type              = "egress"
  security_group_id = "${aws_security_group.sg.id}"
  from_port         = -1
  to_port           = 0
  protocol          = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}
