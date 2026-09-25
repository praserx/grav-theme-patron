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