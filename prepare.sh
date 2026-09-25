#!/bin/bash

# Clean up any existing assets
rm -rf ./assets

# Create required directories
mkdir -p ./assets/{bootstrap/css,semantic-ui/themes/default/assets/fonts,jquery,fontawesome/css,fontawesome/webfonts}

# Copy minimal required Bootstrap assets
cp ./node_modules/bootstrap/dist/css/bootstrap.min.css ./assets/bootstrap/css/

# Copy minimal jQuery assets
cp ./node_modules/jquery/dist/jquery.min.js ./assets/jquery/

# Copy FontAwesome minimal assets
cp ./node_modules/@fortawesome/fontawesome-free/css/all.min.css ./assets/fontawesome/css/
cp -r ./node_modules/@fortawesome/fontawesome-free/webfonts/* ./assets/fontawesome/webfonts/
cp ./node_modules/@fortawesome/fontawesome-free/attribution.js ./assets/fontawesome/ || true
cp ./node_modules/@fortawesome/fontawesome-free/LICENSE.txt ./assets/fontawesome/ || true

# Copy Semantic-UI assets
cp ./node_modules/semantic-ui-css/semantic.* ./assets/semantic-ui/
cp -r ./node_modules/semantic-ui-css/themes/default/assets/fonts/* ./assets/semantic-ui/themes/default/assets/fonts/
