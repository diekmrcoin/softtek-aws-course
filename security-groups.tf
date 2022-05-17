resource "aws_security_group" "web_traffic" {
  name        = "softtek_web_traffic"
  description = "Allow ssh and http inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "Http"
  }
  ingress {

    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Ssh"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "All traffic"
  }
}

resource "aws_security_group" "ssh_traffic" {
  name        = "softtek_ssh_traffic"
  description = "Allow sshinbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {

    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Ssh"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "All traffic"
  }
}
