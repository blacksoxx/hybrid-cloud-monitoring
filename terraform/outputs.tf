output "aws_ec2_public_ip" {
  description = "AWS EC2 instance public IP"
  value       = module.aws_infra.ec2_public_ip
}

output "azure_vm_public_ip" {
  description = "Azure VM public IP"
  value       = module.azure_infra.vm_public_ip
}

output "grafana_url" {
  description = "Grafana dashboard URL"
  value       = "http://${module.azure_infra.vm_public_ip}:3000"
}