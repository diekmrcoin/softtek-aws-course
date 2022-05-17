output "lb_dns" {
  value = "http://${aws_alb.main.dns_name}"
}

output "web_server_01_dns" {
  value = "http://${aws_instance.web_server_01.public_dns}"
}
