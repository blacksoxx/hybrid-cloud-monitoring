# Local values for consistent naming
locals {
  prefix = "${var.project_name}-${var.environment}"
}

# AWS Resources
module "aws_infra" {
  source = "./aws"

  region        = var.aws_region
  instance_type = var.aws_instance_type
  project_name  = var.project_name
  environment   = var.environment
  prefix        = local.prefix
}

# Azure Resources
module "azure_infra" {
  source = "./azure"

  region              = var.azure_region
  vm_size             = var.azure_vm_size
  project_name        = var.project_name
  environment         = var.environment
  prefix              = local.prefix
  subscription_id     = var.azure_subscription_id
  tenant_id           = var.azure_tenant_id
  client_id           = var.azure_client_id
  client_secret       = var.azure_client_secret
}
