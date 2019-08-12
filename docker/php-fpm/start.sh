#!/bin/sh

set -e

# Env variables
COMPOSER=/usr/bin/composer
export server_name=${server_name:-$HOST}

# Set up config
/usr/bin/confd -onetime -backend file -file /config/*.yml

# Install dependencies (composer.json)
cd /application/simplesamlphp || exit 1
if [[ ! -x ${COMPOSER} ]]; then
  (>&2 echo "Composer not found")
  exit 1;
fi
${COMPOSER} install --no-interaction --no-suggest

# Start php-fpm
echo "Starting php-fpm..."
php-fpm -R -F

echo "exited $0"