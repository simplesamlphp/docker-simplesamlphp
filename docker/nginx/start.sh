#!/bin/sh

set -e

# ENV
NPM=/usr/bin/npm

# Set up config
/usr/bin/confd -onetime -backend file -file /config/default.yml -file /config/overrides.yml

# Install npm dependencies (package.json)
cd /application/simplesamlphp || exit 1
if [[ ! -x ${NPM} ]]; then
  (>&2 echo "NPM not found")
  exit 1;
fi

${NPM} install

# Start nginx
echo "Starting nginx..."
nginx -g "daemon off;"

echo "exited $0"