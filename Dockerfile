FROM php:7.4-fpm


RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

ARG PUID=10315
ARG PGID=10004

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install bcmath pdo pdo_pgsql

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN ln -s public html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www

RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www
RUN chmod -R 777 /var/www/storage

RUN composer install

EXPOSE 9000

ENTRYPOINT [ "php-fpm" ]
