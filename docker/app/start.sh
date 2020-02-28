#!/bin/bash
set -e

/local/bin/wait-for-it.sh db:3306 -t 600;
chmod 777 -Rf ../;
composer install --prefer-dist --no-interaction --no-dev;
php artisan config:cache;
php artisan config:clear;
php artisan migrate;
php artisan swoole:http start;
