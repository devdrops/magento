FROM ricardotulio/ecommerce-platforms:latest

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="DevDrops/MagentoOnDocker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="" \
      org.label-schema.schema-version="1.0"

ENV MYSQL_ROOT_PASSWORD root

RUN apt-get update && \
    apt-get -y install \
    mysql-server \
    mysql-client && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/var/www/", "/var/lib/mysql" ]

EXPOSE "80:8080"
EXPOSE "3306"

CMD ["mysqld"]
