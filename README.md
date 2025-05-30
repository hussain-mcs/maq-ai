# laravel, mysql nginx, terraform, docker, lightsail

## Local Useful Commands

From docker folder
# Stop containers
docker-compose -f docker-compose.local.yml down

# Restart containers
docker-compose -f docker-compose.local.yml restart

# Rebuild containers
docker-compose -f docker-compose.local.yml down
docker-compose -f docker-compose.local.yml up --build -d

# View container logs
docker-compose -f docker-compose.local.yml logs nginx
docker-compose -f docker-compose.local.yml logs php
docker-compose -f docker-compose.local.yml logs mariadb

# Execute commands in containers
docker-compose -f docker-compose.local.yml exec php php artisan migrate
docker-compose -f docker-compose.local.yml exec php composer install
 `php artisan key:generate --force`
    `php artisan config:cache`
    `php artisan route:cache`
    `exit`
docker-compose -f docker-compose.local.yml exec mariadb mysql -u root -p

# Visit Application
    `http://localhost:8085/` `http://localhost:8085/hello`  `http://localhost:8086/`

=============================

## Production

- terraform plan
- terraform apply --auto-approve
- extract and store private key
    `terraform output -raw private_key > laravel-hello-world-key.pem`
    `chmod 400 laravel-hello-world-key.pem`
- connect to server
    `ssh -i laravel-hello-world-key.pem ubuntu@IP`

- Get Code
    `sudo git clone https://github.com/hussain-mcs/maq-ai.git /var/www/html/laravel-app`
- Set permission
    `sudo chown ubuntu:ubuntu /var/www/html/laravel-app`
- Go to Docker
    `cd laravel-app && cd docker`
- Build Image
    `docker-compose -f docker-compose.yml up --build -d`

- New Run

### Debug Check Logs

`docker-compose -f docker-compose.yml logs php`

- Update Env Details App Url

- Update Env Details DB

```
DB_CONNECTION=mysql
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```
- Update and copy .env
`docker cp laravel-app/.env $(docker-compose -f docker/docker-compose.yml ps -q php):/var/www/html/.env`

- Go to App Container
    `sudo docker-compose exec php bash`


- Run Migrate
`php artisan migrate`



- Visit Url

# Next
- Automate .env update + DB Details + migrate
- Dynamic Source Download
- https work
- Remote S3 tfstate