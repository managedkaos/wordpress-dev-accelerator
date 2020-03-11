#!/bin/bash -e
echo "Waiting for services to start..."
sleep 15
echo "Installing Wordpress..."
wp core install \
    --url=localhost:13000 \
    --title="WP Development Site" \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@example.com \
    --path=/var/www/html

echo "Removing default plugins..."
wp plugin delete hello
wp plugin delete akismet
