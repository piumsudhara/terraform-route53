variable "aws_region" {
  type        = string
  description = "AWS region for resource deployment"
  default     = "ap-southeast-1"
}

variable "aws_azs" {
  type        = list(string)
  description = "AWS Availability Zones for resources"
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_name" {
  type        = string
  description = "VPC name."
  default     = "test"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block range"
  default     = "10.1.0.0/16"
}

variable "instance_ami" {
  type        = string
  description = "EC2 instance AMI"
  default     = "ami-04b6019d38ea93034"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2_name" {
  type        = string
  description = "EC2 instance name"
  default     = "piums"
}

variable "instance_key" {
  type        = string
  description = "SSH key pair for EC2"
  default     = "piums"
}

variable "user_data_file" {
  type        = string
  description = "Path to EC2 user data script."
  default     = "scripts/install.sh"
}

variable "domain_name" {
  type        = string
  description = "Domain name"
  default     = "lucidns.com"
}

variable "sg_ingress_public" {
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    {
      description = "Allows SSH access"
      port        = 22
    },
    {
      description = "Allows HTTP traffic"
      port        = 80
    },
  ]
}

variable "sg_ingress_private" {
  type = list(object({
    description = string
    port        = number
  }))
  default = []
}

variable "sg_ingress_ports" {
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    {
      description = "Allows HTTP traffic"
      port        = 80
    },
  ]
}