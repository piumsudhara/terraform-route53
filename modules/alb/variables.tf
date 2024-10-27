variable "aws_region" {
  type        = string
  description = "AWS region for resource deployment"
}

variable "aws_azs" {
  type        = list(string)
  description = "AWS Availability Zones for resources"
}

variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "public_subnets" {
  type        = list(string)
  description = "AWS Public subnets"
}

variable "instance_ids" {
  type        = list(string)
  description = "EC2 Instance ID"
}

variable "domain_name" {
  type        = string
  description = "Domain Name"
}