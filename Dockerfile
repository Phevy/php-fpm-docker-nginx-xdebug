FROM php:8.0.9-fpm

RUN apt-get update && apt-get install -y \
	git \
	curl \
	zip \
	unzip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install additional PHP libraries
RUN docker-php-ext-install bcmath pdo_mysql
 
# Install xdebug
RUN pecl install xdebug \
&& docker-php-ext-enable xdebug

# Enable XDebug
ADD xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www