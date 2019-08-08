SimpleSAMLPHP Docker environment
================================

# Quick start

### Configure

Configure the docker environment using the file [docker/config.yml](docker/config.yml).

For further configuration, see;
- [docker/nginx/confd/app-server.conf.tmpl]()
- [docker/nginx/confd/fastcgi.conf.tmpl]()
- [docker/php-fpm/confd/php.ini.tmpl]()
- [docker/php-fpm/confd/php-fpm.conf.tmpl]()

### Build

The first time you run/build the docker containers, run `./bootstrap.sh`. This will setup the docker `env_file`, based off what you have configured in [docker/config.yml](config.yml).
It will also clone the SimpleSAMLPhp git repository (also defined in the `config.yml` file) if it doesn't already exist.

### Run

The docker containers is started by running `docker-compose up`.

```
./bootstrap.sh --new --config="./docker/config.yml" --name="ssp1.dev"
  -->       
    environments
      /ssp1.dev
        /.docker.env
        /docker-compose.ssp1.dev.yml
        /run.sh
            `docker-compose -f ../../docker-compose.yml -f docker-compose.ssp1.dev.yml up -d`
```
