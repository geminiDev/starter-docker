FROM php:7.4.10-fpm-buster
# RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
COPY conf/app-php.ini  /usr/local/etc/php/conf.d/app-php.ini

