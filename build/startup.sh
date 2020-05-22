#! /bin/sh
test -d vendor || composer install --no-dev
if [ ! -f "www/assets/js/bundle.js" ]
then
  npm install
  npm run build
fi
exec "$@"
