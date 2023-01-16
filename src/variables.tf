
variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-2"
}

variable "aws_vpc" {
  description = "Creating the VPC."
  default     = "some_custom_vpc"
}

variable "subnet_availability_zones" {
  description = "List of AZs to spread VPC subnets over."
  type        = list(string)

  default = [
    "ap-southeast-1a",
    "ap-southeast-1b",
    "ap-southeast-1c",
  ]
}

variable "aws_subnet" {
  description = " Create Public Subnet"
  default     =  "some_public_subnet"

variable "aws_subnet" {
  description = " Create Private Subnet"
  default     =  "some_private_subnet"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "Jenkins VM"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "Jenkins VMS"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0404222d649e3cbeb"
}
