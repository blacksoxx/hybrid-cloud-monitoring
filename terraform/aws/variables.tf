variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
  default     = "hybrid-cloud-monitoring"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "prefix" {
  description = "Resource name prefix"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "enable_detailed_monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = true
}

variable "additional_tags" {
  description = "Additional tags for AWS resources"
  type        = map(string)
  default     = {}
}