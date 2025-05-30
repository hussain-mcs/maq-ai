#!/bin/bash
START_TIME=$(date +%s)
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
git clone https://github.com/hussain-mcs/maq-ai.git /var/www/laravel-app

# Set permissions and ownership
chmod -R 755 /var/www/laravel-app
chown ubuntu:ubuntu /var/www/laravel-app

# Copy Docker Compose file
cd /var/www/laravel-app/docker && docker-compose -f docker-compose.yml up --build -d


# Install AWS CLI (optional, for deployment scripts)
apt-get install -y awscli
apt-get install -y vim

# Create swap file (recommended for small instances)
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

echo "Server setup completed!" > /home/ubuntu/setup-complete.txt

END_TIME=$(date +%s)
SETUP_TIME=$((END_TIME - START_TIME))

echo "Setup started at: $(date -d @$START_TIME)"
echo "Setup ended at:   $(date -d @$END_TIME)"
echo "Total setup time: ${SETUP_TIME} seconds"

echo "Setup started at: $(date -d @$START_TIME)" >> /home/ubuntu/setup-complete.txt
echo "Setup ended at:   $(date -d @$END_TIME)" >> /home/ubuntu/setup-complete.txt
echo "Total setup time: ${SETUP_TIME} seconds" >> /home/ubuntu/setup-complete.txt
