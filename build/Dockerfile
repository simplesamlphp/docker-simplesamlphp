FROM amd64/php:7.3.13-apache
ENV APACHE_DOCUMENT_ROOT /code/www
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  git \
  libmemcached-dev \
  libpng-dev \
  unzip \
  zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install -j5 gd mbstring mysqli pdo pdo_mysql \
   && pecl install memcached redis xdebug \
   && docker-php-ext-enable memcached redis xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2dismod mpm_event && a2enmod mpm_prefork
COPY apache2.conf /etc/apache2/
COPY mpm_prefork.conf /etc/apache2/mod_available/
COPY startup.sh /
ENTRYPOINT ["/startup.sh"]
CMD ["php", "-S", "0.0.0.0:8732", "-t", "/code/www"]
