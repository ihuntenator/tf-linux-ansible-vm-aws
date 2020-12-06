data "aws_ami" "centos" {
  most_recent = true
  owners - ["amazon"]
  filters {}
}
