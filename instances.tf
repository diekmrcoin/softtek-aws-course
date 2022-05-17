resource "aws_instance" "web_server_01" {
  ami             = "ami-021d41cbdefc0c994" # eu-west-3
  instance_type   = "t3a.micro" # vCPU(2) RAM(1GiB) $0,0094/h
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = [
    aws_security_group.web_traffic.id
  ]
  subnet_id = aws_subnet.subnet_a.id
  user_data = file("${path.module}/user-data/web-server-01.sh")

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 12
    volume_type = "gp2"
    delete_on_termination = true
  }
}

// TODO: add load balancer
// TODO: add server 2
