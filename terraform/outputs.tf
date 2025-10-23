# AWS Outputs
output "aws_ec2_public_ip" {
  description = "AWS EC2 instance public IP"
  value       = module.aws_infra.ec2_public_ip
}

output "aws_ec2_private_ip" {
  description = "AWS EC2 instance private IP"
  value       = module.aws_infra.ec2_private_ip
}

output "aws_s3_bucket_name" {
  description = "AWS S3 bucket name"
  value       = module.aws_infra.s3_bucket_name
}

output "aws_vpc_id" {
  description = "AWS VPC ID"
  value       = module.aws_infra.vpc_id
}

# Azure Outputs
output "azure_vm_public_ip" {
  description = "Azure VM public IP"
  value       = module.azure_infra.vm_public_ip
}

output "azure_vm_private_ip" {
  description = "Azure VM private IP"
  value       = module.azure_infra.vm_private_ip
}

output "azure_storage_account_name" {
  description = "Azure storage account name"
  value       = module.azure_infra.storage_account_name
}

output "azure_resource_group_name" {
  description = "Azure resource group name"
  value       = module.azure_infra.resource_group_name
}

# Grafana Outputs
output "grafana_url" {
  description = "Grafana dashboard URL"
  value       = "http://${module.azure_infra.vm_public_ip}:3000"
}

output "grafana_credentials" {
  description = "Grafana default credentials"
  value       = "Username: admin / Password: admin123"
  sensitive   = true
}

# SSH Access Outputs
output "ssh_aws_command" {
  description = "SSH command to connect to AWS EC2 instance"
  value       = "ssh -i ~/.ssh/id_rsa ubuntu@${module.aws_infra.ec2_public_ip}"
}

output "ssh_azure_command" {
  description = "SSH command to connect to Azure VM"
  value       = "ssh adminuser@${module.azure_infra.vm_public_ip}"
}

# Monitoring Endpoints
output "prometheus_aws_endpoint" {
  description = "Prometheus metrics endpoint for AWS EC2"
  value       = "http://${module.aws_infra.ec2_public_ip}:9100/metrics"
}

output "prometheus_azure_endpoint" {
  description = "Prometheus metrics endpoint for Azure VM"
  value       = "http://${module.azure_infra.vm_public_ip}:9100/metrics"
}