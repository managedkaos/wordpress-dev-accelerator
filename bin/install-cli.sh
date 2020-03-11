#!/bin/bash -e
echo "Waiting for services to start..."
sleep 15

echo "Installing WP-CLI..."
/usr/bin/curl --silent \
    --output /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x /usr/local/bin/wp

/usr/local/bin/wp --info

echo "Installing Wordpress..."
/usr/local/bin/wp core install \
    --url=localhost:13000 \
    --title="WP Development Site" \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@example.com \
    --path=/var/www/html

echo "Removing default plugins..."
./wp plugin delete hello
./wp plugin delete akismet
