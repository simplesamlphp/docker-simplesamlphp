#! /bin/sh
test -d vendor || composer install --no-dev
exec "$@"
