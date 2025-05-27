# laravel, mysql nginx, terraform, docker, lightsail

# Running on Local

- Go to Docker Folder, Down existing run
    `docker-compose -f docker-compose.local.yml down -v`
- Run in Detached Mode
    `docker-compose -f docker-compose.local.yml up --build -d`
- Go inside application container (php) and run execution commands
    `docker-compose -f docker-compose.local.yml exec php bash`
    `composer install`
    `php artisan key:generate --force`
    `php artisan migrate`
    `php artisan config:cache`
    `php artisan route:cache`
    `exit`

- Visit Application
    `http://localhost:8085/` `http://localhost:8085/hello`  `http://localhost:8086/`

## Local Useful Commands

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
docker-compose -f docker-compose.local.yml exec mariadb mysql -u root -p

=============================

## Production

- Down existing
    ``
- New Run

- Go to App Container
    ` sudo docker-compose exec php bash`

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


- Run Migrate
`php artisan migrate`



- Visit Url


- Automate .env update + DB Details + migrate