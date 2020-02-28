FROM php:7.4-fpm

WORKDIR /var/www

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update \
    && apt-get install -y git locate vim wget zlib1g-dev libjpeg-dev unzip libpng-dev libfreetype6-dev mcrypt libpq-dev libfontconfig1 libxrender1 iputils-ping \
    && pecl install swoole \
    && docker-php-ext-install gd pdo pdo_mysql bcmath \
    && docker-php-ext-enable swoole \
    && echo "opcache.enable_cli=1" >> /usr/local/etc/php/php.ini \
    && echo "opcache.validate_timestamps=0" >> /usr/local/etc/php/php.ini \
    && rm -rf /var/lib/apt/lists/*

COPY ./wait-for-it.sh /local/bin/wait-for-it.sh
COPY ./start.sh /local/bin/start.sh

RUN chmod +x /local/bin/start.sh \
   && chmod +x /local/bin/wait-for-it.sh \
   && echo "error_log = /proc/self/fd/1" >> /usr/local/etc/php/php.ini \
   && echo "access.log = /proc/self/fd/2" >> /usr/local/etc/php/php.ini

ENTRYPOINT ["/local/bin/start.sh"]
EXPOSE 1215
