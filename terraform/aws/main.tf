# Data source for AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-22.04-*-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name_prefix = "${var.prefix}-ec2"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix}-ec2-sg"
    Project     = var.project_name
    Environment = var.environment
  }
}

# EC2 Instance
resource "aws_instance" "monitoring_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ec2_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              # Install Node Exporter for system metrics
              wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
              tar xzf node_exporter-1.6.1.linux-amd64.tar.gz
              cd node_exporter-1.6.1.linux-amd64
              ./node_exporter &
              EOF

  tags = {
    Name        = "${var.prefix}-ec2"
    Project     = var.project_name
    Environment = var.environment
  }
}

# SSH Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.prefix}-key"
  public_key = file("~/.ssh/id_rsa.pub") # Update path to your public key
}

# S3 Bucket
resource "aws_s3_bucket" "data_bucket" {
  bucket = "${var.prefix}-data-bucket"

  tags = {
    Name        = "${var.prefix}-s3"
    Project     = var.project_name
    Environment = var.environment
  }
}

# IAM Role for CloudWatch
resource "aws_iam_role" "cloudwatch_role" {
  name = "${var.prefix}-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Outputs
output "ec2_public_ip" {
  value = aws_instance.monitoring_server.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.data_bucket.bucket
}