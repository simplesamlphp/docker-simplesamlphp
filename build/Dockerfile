FROM debian:buster
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  git \
  php7.3-cli \
  php7.3-curl \
  php7.3-dom \
  php7.3-mbstring \
  php7.3-sqlite3 \
  php7.3-xdebug \
  unzip \
  && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY startup.sh /
ENTRYPOINT ["/startup.sh"]
CMD ["php", "-S", "0.0.0.0:8732", "-t", "/code/www"]
