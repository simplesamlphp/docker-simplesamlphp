#! /bin/sh
test -d vendor || composer install --no-dev
test -d node_modules || npm install
test -f www/assets/js/bundle.js || npm run build
exec "$@"
