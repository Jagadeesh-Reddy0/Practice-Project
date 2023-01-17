
variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-south-1"
}

variable "aws_vpc" {
  description = "Creating the VPC."
  default     = "some_custom_vpc"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  default     = "true"
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults true."
  default     = "true"
}

variable "subnet_availability_zones" {
  description = "List of AZs to spread VPC subnets over."
  type        = list(string)

  default = [
    "ap-south-1a",
    "ap-south-1b",
    ]
}

variable "aws_subnet" {
  description = " Create Public Subnet"
  default     =  "some_public_subnet"
}

variable "aws_subnet" {
  description = " Create Private Subnet"
  default     =  "some_private_subnet"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "rg_Mumbai"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "web_sg"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0404222d649e3cbeb"
}
