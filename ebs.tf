resource "aws_ebs_volume" "demo-ebs" {
  availability_zone = "us-west-2a"
  size              = 40
}
resource "aws_volume_attachment" "demo-ebs1" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.demo-ebs.id
  instance_id = aws_instance.demo1.id

}