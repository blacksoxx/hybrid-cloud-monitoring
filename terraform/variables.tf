# AWS Variables
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "aws_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# Azure Variables
variable "azure_region" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "azure_vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B1s"
}

# Common Variables
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

# Secrets (set via environment variables or terraform.tfvars)
variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "azure_client_id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

# SSH Configuration
variable "ssh_public_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# Network Configuration
variable "aws_vpc_cidr" {
  description = "AWS VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_public_subnet_cidr" {
  description = "AWS public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "azure_vnet_address_space" {
  description = "Azure virtual network address space"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "azure_subnet_address_prefixes" {
  description = "Azure subnet address prefixes"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

# Monitoring Configuration
variable "enable_detailed_monitoring" {
  description = "Enable detailed monitoring for instances"
  type        = bool
  default     = true
}

# Additional Tags
variable "additional_tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}