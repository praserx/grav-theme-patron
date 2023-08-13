#!/bin/bash

mkdir -p ./assets/{bootstrap,semantic-ui,jquery,fontawesome,popperjs}

cp -r ./node_modules/bootstrap/dist/* ./assets/bootstrap
cp -r ./node_modules/jquery/dist/* ./assets/jquery
cp -r ./node_modules/@fortawesome/fontawesome-free/* ./assets/fontawesome
cp -r ./node_modules/@popperjs/core/dist/esm/* ./assets/popperjs
cp ./node_modules/semantic-ui-css/semantic.* ./assets/semantic-ui
