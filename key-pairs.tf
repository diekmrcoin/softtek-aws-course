resource "aws_key_pair" "key_pair" {
  public_key = file("${path.module}/aws-intro.pem.pub")
  key_name   = var.project_name
  tags       = {
    type = "rsa"
  }
}
