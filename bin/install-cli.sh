#!/bin/bash -e
echo "Waiting for services to start..."
sleep 15

echo "Installing WP-CLI..."
/usr/bin/curl --silent \
    --output /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x /usr/local/bin/wp
mkdir -p /var/www/.wp-cli/
chown -R www-data:www-data /var/www/.wp-cli/
