FROM ricardotulio/ecommerce-platforms:latest

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

COPY magento-sources/magento1.9.1.1.tar.gz /tmp

WORKDIR /var/www
RUN tar -xzf /tmp/magento1.9.1.1.tar.gz && \
    rm -rf /tmp/magento1.9.1.1.tar.gz

RUN chown www-data:www-data -R /var/www/
