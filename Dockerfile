FROM ricardotulio/ecommerce-platforms:latest

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

COPY magento1.9.1.1.tar.gz /var/www

WORKDIR /var/www
RUN tar -xzf magento1.9.1.1.tar.gz
