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
