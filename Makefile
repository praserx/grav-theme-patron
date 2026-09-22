<<<<<<< HEAD
# Makefile for Grav theme asset management

install:
	npm install

update:
	npm update

prepare:
	bash prepare.sh

prettier-check:
	npm run prettier:check

prettier-fix:
	npm run prettier:fix
=======
# Variables
PHP = php
COMPOSER = composer
PHPUNIT = vendor/bin/phpunit
PHPCS = vendor/bin/phpcs
PHPCBF = vendor/bin/phpcbf

# Default target
all: install test

# Install dependencies
install:
    $(COMPOSER) install

# Run tests
test:
    $(PHPUNIT)

# Run code sniffer
lint:
    $(PHPCS) --standard=PSR12 src/

# Fix coding standards
fix:
    $(PHPCBF) --standard=PSR12 src/

# Clean up
clean:
	rm -rf vendor
	rm -rf composer.lock
	rm -rf node_modules
	rm -rf assets

.PHONY: all install test lint fix clean
>>>>>>> e2e00fb (feat: Bump version to 3.0.0-alpha and update dependencies)
