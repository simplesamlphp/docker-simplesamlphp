FROM debian:buster
RUN apt-get update && apt-get install -y --no-install-recommends \
  apache2 \
  ca-certificates \
  curl \
  git \
  libapache2-mod-php7.3 \
  php7.3-cli \
  php7.3-curl \
  php7.3-dom \
  php7.3-mbstring \
  php-memcache \
  php7.3-mysql \
  php7.3-sqlite3 \
  php7.3-ldap \
  php7.3-xdebug \
  unzip \
  && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2dismod mpm_event && a2enmod mpm_prefork
COPY apache2.conf /etc/apache2/
COPY mpm_prefork.conf /etc/apache2/mod_available/
COPY startup.sh /
ENTRYPOINT ["/startup.sh"]
CMD ["php", "-S", "0.0.0.0:8732", "-t", "/code/www"]
