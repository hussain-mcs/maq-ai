terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Create Lightsail key pair
resource "aws_lightsail_key_pair" "laravel_key" {
  name = "${var.project_name}-key"
}

# Create Lightsail instance
resource "aws_lightsail_instance" "laravel_server" {
  name              = "${var.project_name}-server"
  availability_zone = "${var.aws_region}a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = var.bundle_id
  key_pair_name     = aws_lightsail_key_pair.laravel_key.name
  user_data         = file("${path.module}/user-data.sh")

  tags = {
    Name        = "${var.project_name}-server"
    Environment = var.environment
  }
}

# Create static IP
resource "aws_lightsail_static_ip" "laravel_static_ip" {
  name = "${var.project_name}-static-ip"
}

# Attach static IP to instance
resource "aws_lightsail_static_ip_attachment" "laravel_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.laravel_static_ip.name
  instance_name  = aws_lightsail_instance.laravel_server.name
}

# Open ports
resource "aws_lightsail_instance_public_ports" "laravel_ports" {
  instance_name = aws_lightsail_instance.laravel_server.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidrs     = ["0.0.0.0/0"]
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidrs     = ["0.0.0.0/0"]
  }

  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
    cidrs     = ["0.0.0.0/0"]
  }

  port_info {
    protocol  = "tcp"
    from_port = 8080
    to_port   = 8080
    cidrs     = ["0.0.0.0/0"]
  }
}