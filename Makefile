.PHONY: clear install importdb

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))

# Safe sequence:
# 1. make clear
# 2. docker-compose up -d
# 3. make install

clear:
	sudo rm -rf $(PWD)www/*
	sudo rm -rf $(PWD)data/*

importdb:
	docker-compose exec mysql mysql -uroot -proot < $(PWD)www/dump.sql

install:
	tar -xzf $(PWD)magento-sources/$(PACKAGE) -C $(PWD)www
	$(MAKE) importdb
