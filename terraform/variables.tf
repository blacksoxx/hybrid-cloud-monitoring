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