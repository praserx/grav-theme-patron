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
