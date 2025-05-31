- A: Docker Absolute Path vs simple Path
- B: Volume Name Append Folder Directlory
- C: Site can not be Reached, Bad Gateway


### A:

    // if [ ! -f /var/www/html/.env ]; then
    //     cp /var/www/html/.env.example /var/www/html/.env
    // fi

cp .env.example .env

Above Failed Later worked


### B:
name param added, otherwise docker (foldername) was appended
volumes:
  mariadb_data:
    name: mariadb_data #If this is not specified, Docker will create a volume with a random name. Folder Name append
  laravel_app:
    name: laravel_app

### C:
  Wait for all execution to be finished, 
  confirm if PMA is ready, verify /home/ubuntu/setup-complete.txt file exists