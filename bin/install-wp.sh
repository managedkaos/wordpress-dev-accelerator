#!/bin/bash -e
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

echo "Updating default themes..."
wp theme update --all
