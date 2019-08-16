SimpleSAMLPHP Docker environment
================================

# Quick start

### Configure

Configure the docker environment using the file [docker/config.yml](docker/config.yml), and optionally add more files per environment as overrides, i.e: ` --config=docker/config.yml --config=docker/config-overrides.yml`

#### TL;DR

```
# Clone this repository
git clone https://github.com/simplesamlphp/simplesamlphp-docker.git && cd simplesamlphp-docker
# Prepare codebase
./bootstrap.sh 
# Create an environment of simplesamlphp
./ssamlphp-docker.sh --add --name="my-ssamlphp-sp"
# Edit configuration files as nescessary
`ssamlphp_configs/my-ssamlphp-sp` will now contain two folders, `config` and `metadata` - prepopulated with the templates from the simplesamlphp repository.
Edit/delete these files as nescessary.

# Build docker environment
./ssamlphp-docker.sh --build --name="my-ssamlphp-sp"

# Run docker environment
./ssamlphp-docker.sh --run --name="my-ssamlphp-sp"

```

#### References
For further configuration, see;

- [docker/nginx/confd/app-server.conf.tmpl](docker/nginx/confd/app-server.conf.tmpl)
- [docker/nginx/confd/fastcgi.conf.tmpl](docker/nginx/confd/fastcgi.conf.tmpl)
- [docker/php-fpm/confd/php.ini.tmpl](docker/php-fpm/confd/php.ini.tmpl)
- [docker/php-fpm/confd/php-fpm.conf.tmpl](docker/php-fpm/confd/php-fpm.conf.tmpl)