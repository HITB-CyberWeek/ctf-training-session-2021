FROM php:apache

# Install some pre-requisites
RUN apt update && apt install git unzip -y

# Move the service into the container
WORKDIR /var/www/html
ADD . /var/www/html
RUN chown www-data:www-data -R /var/www/html

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install php-extension-installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync

# Install some php extensions first
RUN install-php-extensions mysqli xml tokenizer zip

# Run composer install to install the dependencies
RUN composer update && composer install --optimize-autoloader --no-interaction --no-progress

EXPOSE 80