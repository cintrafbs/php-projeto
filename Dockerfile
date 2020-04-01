FROM php:7.3-apache

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
software-properties-common \
libpq-dev \
git \
curl \
unzip \
zip \
zlib1g-dev \
libzip-dev \
vim

RUN docker-php-ext-configure zip --with-libzip

RUN docker-php-ext-install pdo_pgsql zip

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite

WORKDIR /var/www/html

EXPOSE 80