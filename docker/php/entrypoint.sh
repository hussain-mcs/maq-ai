#!/bin/bash

set -e
echo "Starting entrypoint..."

composer install --no-dev --optimize-autoloader

cp .env.example .env

echo "Generating app key"
php artisan key:generate --force

echo "Running migrations"
php artisan migrate --force
# Add other artisan commands as needed
echo "Caching config"
php artisan config:cache

echo "Caching routes"
php artisan route:cache

echo "=============================================="
echo "Laravel container is READY. Starting php-fpm..."
echo "=============================================="

exec "$@"