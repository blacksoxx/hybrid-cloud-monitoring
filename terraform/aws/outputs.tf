output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.monitoring_server.public_ip
}

output "ec2_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.monitoring_server.private_ip
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.monitoring_server.id
}

output "ec2_availability_zone" {
  description = "EC2 instance availability zone"
  value       = aws_instance.monitoring_server.availability_zone
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.data_bucket.bucket
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.data_bucket.arn
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.ec2_sg.id
}

output "cloudwatch_role_arn" {
  description = "CloudWatch IAM role ARN"
  value       = aws_iam_role.cloudwatch_role.arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}