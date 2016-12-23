.PHONY: clear install importdb

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))

# Safe sequence:
# 1. make clear
# 2. docker-compose up -d
# 3. make install PACKAGE=...
# 4. make importdb

clear:
	@tput setaf 3
	sudo rm -rf $(PWD)www/*
	sudo rm -rf $(PWD)data/*

importdb:
	@tput setaf 3
	docker-compose exec mysql /bin/bash -c 'mysql -uroot -proot < /releases/1.9.1.1.sql'

PACKAGE=""
install:
        ifeq ($(strip $(PACKAGE)),"")
	@tput setaf 1
	@echo 'Please provide the PACKAGE.'
        else
	@tput setaf 3
	tar -xzf $(PWD)magento-sources/$(PACKAGE) -C $(PWD)www

	@sleep 8
        endif
