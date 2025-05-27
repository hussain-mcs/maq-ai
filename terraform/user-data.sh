#!/bin/bash

# Update system
apt-get update -y
apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker ubuntu

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install Git
apt-get install -y git

# Create application directory
mkdir -p /var/www/laravel-app
chown ubuntu:ubuntu /var/www/laravel-app

# Install AWS CLI (optional, for deployment scripts)
apt-get install -y awscli
ap-get install -y vim

# Create swap file (recommended for small instances)
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

echo "Server setup completed!" > /home/ubuntu/setup-complete.txt