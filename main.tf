data "aws_ami" "amazon" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
  }
}

resource "aws_instance" "kibana" {
  ami                    = "${data.aws_ami.amazon.id}"
  instance_type          = "t3.micro"
  count                  = 2
  vpc_security_group_ids = ["sg-050bd1e3f07894680"]
  key_name               = "DV Key Pair"

  tags = {
    Name         = "Kibana ${count.index + 1} "
    TowerManaged = "True"
    Role         = "Kibana"
  }
}
