resource "aws_security_group" "ec2_security_group" {
  description = "Allow traffic for EC2 Webservers"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    iterator = sg_ingress

    content {
      description = sg_ingress.value["description"]
      from_port   = sg_ingress.value["port"]
      to_port     = sg_ingress.value["port"]
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags =  {
    Name = "sg-webserver"
  }
}

resource "aws_instance" "web" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.instance_key
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  count     = length(var.private_subnets)
  subnet_id = element(var.private_subnets, count.index)
  user_data = file(var.user_data_file)

  tags = {
    Name = "ec2-${count.index + 1}"
  }
}