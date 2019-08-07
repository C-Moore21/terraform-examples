resource "aws_alb_target_group" "test" {
  name     = "tf-alb-group"
  port     = 80
  protocol = "HTTP"
}

resource "aws_alb" "main" {
  name            = "tf-alb"
#  subnets         = ["${aws_subnet.main.*.id}"]
  security_groups = ["${aws_security_group.sg.id}"]
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.main.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.test.id}"
    type             = "forward"
  }
}
