variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "aws_region" {
  type        = string
  description = "AWS Availability Zones for resources"
}

variable "aws_azs" {
  type        = list(string)
  description = "AWS Availability Zones for resources"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block range"
}
