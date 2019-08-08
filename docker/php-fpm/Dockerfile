FROM php:7.2-fpm-alpine
WORKDIR "/application"

# Install selected extensions and other stuff
ENV MEMCACHED_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev
RUN apk add --no-cache --update libmemcached-libs zlib
RUN \
    apk --no-cache add --virtual .build-deps $PHPIZE_DEPS \
    && apk --no-cache add --virtual .memcached-deps $MEMCACHED_DEPS \
    && apk --no-cache add --virtual .ext-deps libxml2-dev krb5-dev openldap-dev \
    && docker-php-source extract \
    && docker-php-ext-install hash dom ldap \
    && pecl install redis xdebug krb5 memcached \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-enable krb5 \
    && docker-php-ext-enable memcached \
    && docker-php-source delete \
    && apk --no-cache add curl git openssh \
    && apk del .build-deps \
    && curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Add confd
ENV CONFD_VERSION=0.16.0
ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /usr/bin/confd
RUN chmod +x /usr/bin/confd
ADD confd/*.tmpl /etc/confd/templates/
ADD confd/*.toml /etc/confd/conf.d/
ADD start.sh /start.sh

RUN  ["/start.sh"]
