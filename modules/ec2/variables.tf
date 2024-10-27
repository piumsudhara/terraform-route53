variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "private_subnets" {
  type        = list(string)
  description = "AWS Private subnets"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "instance_ami" {
  type        = string
  description = "EC2 instance AMI"
}

variable "ec2_name" {
  type        = string
  description = "EC2 instance name"
}

variable "instance_key" {
  type        = string
  description = "SSH key pair for EC2"
}

variable "user_data_file" {
  type        = string
  description = "Path to EC2 user data script"
}

variable "sg_ingress_ports" {
  description = "Additional specific ingress rules"
}
