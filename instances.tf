resource "aws_instance" "web_server_01" {
  ami           = "ami-021d41cbdefc0c994" # eu-west-3
  instance_type = "t3a.micro"             # vCPU(2) RAM(1GiB) $0,0094/h
  key_name      = aws_key_pair.key_pair.key_name
  security_groups = [
    aws_security_group.web_ssh_traffic.id
  ]
  subnet_id = aws_subnet.subnet_a.id
  user_data = file("${path.module}/user-data/web-server-01.sh")

  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 12
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name       = var.project_name
      host       = "ec2"
      machine    = "web-server-01"
      owner      = var.owner
      deployment = var.deployment
    }
  }
  lifecycle {
    ignore_changes = [
      security_groups,
      network_interface,
      disable_api_termination,
      ebs_optimized,
      hibernation,
      credit_specification,
      ephemeral_block_device
    ]
  }
}

resource "aws_instance" "web_server_02" {
  ami           = "ami-021d41cbdefc0c994" # eu-west-3
  instance_type = "t3a.micro"             # vCPU(2) RAM(1GiB) $0,0094/h
  key_name      = aws_key_pair.key_pair.key_name
  security_groups = [
    aws_security_group.web_ssh_traffic.id
  ]
  subnet_id = aws_subnet.subnet_a.id
  user_data = file("${path.module}/user-data/web-server-02.sh")

  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 12
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name       = var.project_name
      host       = "ec2"
      machine    = "web-server-01"
      owner      = var.owner
      deployment = var.deployment
    }
  }
  lifecycle {
    ignore_changes = [
      security_groups,
      network_interface,
      disable_api_termination,
      ebs_optimized,
      hibernation,
      credit_specification,
      ephemeral_block_device
    ]
  }
}
