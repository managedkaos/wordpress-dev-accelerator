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
wp plugin delete akismet hello

echo "Installing development plugins..."
wp plugin install all-in-one-wp-migration
wp plugin activate all-in-one-wp-migration

echo "Updating default themes..."
wp theme update --all
