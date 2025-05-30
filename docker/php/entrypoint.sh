#!/bin/bash

set -e
echo "Starting entrypoint..."

if [ ! -f /var/www/html/.env ]; then
    cp /var/www/html/.env.example /var/www/html/.env
fi

if [ ! -f /var/www/laravel-app/laravel-app/.env ]; then
    cp /var/www/laravel-app/laravel-app/.env.example /var/www/laravel-app/laravel-app/.env
fi

echo "Running composer install"
composer install

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