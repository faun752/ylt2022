data "aws_prefix_list" "s3_pl" {
  name = "com.amazonaws.*.s3"
}

data "aws_ami" "app" {
  most_recent = true
  owners      = ["self", "amazon"]

  # filter {
  #   name   = "name"
  #   values = ["ylt2022-ap-ami"]
  # }

  filter {
    name = "name"
    // hvm-2.0.以降は日付となっているが、*を指定しておくことで最新の複数のAMIを取得可能
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}