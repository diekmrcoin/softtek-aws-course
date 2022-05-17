resource "aws_alb" "main" {
  name            = var.project_name
  internal        = false
  security_groups = [aws_security_group.web_traffic.id]
  subnets         = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  idle_timeout               = 10
  enable_deletion_protection = false
  depends_on = [
    aws_instance.web_server_01
  ]
}

resource "aws_alb_target_group" "tg_main" {
  name        = var.project_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    path                = "/"
    interval            = 10
    port                = 80
    protocol            = "HTTP"
    timeout             = 3
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
  depends_on = [
    aws_instance.web_server_01
  ]
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.tg_main.arn
    type             = "forward"
  }
}

resource "aws_alb_target_group_attachment" "alb_tg_att_01" {
  target_group_arn = aws_alb_target_group.tg_main.arn
  target_id        = aws_instance.web_server_01.private_ip
  port             = 80
}
