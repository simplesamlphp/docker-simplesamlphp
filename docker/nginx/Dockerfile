FROM nginx:alpine
WORKDIR "/application"
RUN apk add --no-cache --virtual npm

ARG confd_file=docker/config.yml

# Add confd
ENV CONFD_VERSION=0.16.0
ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /usr/bin/confd
RUN chmod +x /usr/bin/confd
ADD docker/nginx/confd/app-server.conf.tmpl /etc/confd/templates/
ADD docker/nginx/confd/fastcgi.conf.tmpl /etc/confd/templates/
ADD docker/nginx/confd/app-server.toml /etc/confd/conf.d/
ADD docker/nginx/confd/fastcgi.toml /etc/confd/conf.d/

ADD docker/config.yml /config/default.yml
ADD ${confd_file} /config/overrides.yml

ADD docker/nginx/start.sh /start.sh

#RUN  ["/start.sh"]
