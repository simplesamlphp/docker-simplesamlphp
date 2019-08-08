FROM nginx:alpine
WORKDIR "/application"
RUN apk add --no-cache --virtual npm

# Add confd
ENV CONFD_VERSION=0.16.0
ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /usr/bin/confd
RUN chmod +x /usr/bin/confd
ADD confd/*.tmpl /etc/confd/templates/
ADD confd/*.toml /etc/confd/conf.d/
ADD start.sh /start.sh

RUN  ["/start.sh"]
