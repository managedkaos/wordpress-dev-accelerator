#!/bin/bash -e
echo "Waiting for services to start..."
sleep 15

echo "Installing WP-CLI..."
/usr/bin/curl --silent \
    --output wp-cli \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x ./wp-cli
./wp-cli --info

echo "Installing Wordpress..."
./wp-cli core install \
    --url=localhost:13000 \
    --title="WP Development Site" \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@example.com \
    --path=/var/www/html

echo "Removing default plugins..."
./wp-cli plugin delete hello
./wp-cli plugin delete akismet
