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

# Path: outputs.tf
//outputs for the module

output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.instance.id
}

output "instance_public_ip" {
  description = "Instance public IP"
  value       = aws_instance.instance.public_ip
}

# Path: main.tf
//main file for the module

resource "aws_instance" "instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = var.subnet_ids[0]
  tags                   = var.tags
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["