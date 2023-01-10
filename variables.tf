//variables for the module

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list
}

variable "instance_type" {
  description = "Instance type"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-0f0c4d4e4d4e4e4e4"
}

variable "key_name" {
  description = "Key name"
  default     = "test-key"
}

variable "name" {
  description = "Name"
  default     = "test-instance"
}

variable "tags" {
  description = "Tags"
  type        = map
  default     = {}
}