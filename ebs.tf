# Cannot mix manual volume managing with ec2 root ebs
#resource "aws_ebs_volume" "web_server_01" {
#  availability_zone = var.default_zone
#  size              = 10
#  type              = "gp2"
#}
#
#resource "aws_volume_attachment" "web_server_01_attachment" {
#  device_name = "/dev/xvda"
#  volume_id   = aws_ebs_volume.web_server_01.id
#  instance_id = aws_instance.web_server_01.id
#}
