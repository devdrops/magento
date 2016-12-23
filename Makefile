.PHONY: clear install importdb

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))
PACKAGE=""

# Safe sequence:
# 1. make clear
# 2. docker-compose up -d
# 3. make install PACKAGE=xyz
# 4. make importdb

clear:
	sudo rm -rf $(PWD)www/*
	sudo rm -rf $(PWD)data/*

importdb:
        ifeq ($(strip $(PACKAGE)),"")
	@tput setaf 1
	@echo 'Please provide the PACKAGE.'
        else
	docker-compose exec mysql /bin/bash -c 'mysql -uroot -proot < /releases/$(PACKAGE).sql'
        endif

install:
        ifeq ($(strip $(PACKAGE)),"")
	@tput setaf 1
	@echo 'Please provide the PACKAGE.'
        else
	tar -xzf $(PWD)magento-sources/$(PACKAGE).tar.gz -C $(PWD)www

	@echo 'Done! Now waiting for MySQL container...'
	@sleep 8

	$(MAKE) importdb
        endif
