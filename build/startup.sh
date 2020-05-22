#! /bin/sh
test -d vendor || composer install --no-dev
if [ ! -f "www/assets/js/bundle.js" ]
then
  test -d node_modules || npm install
  npm run build
fi
exec "$@"
