#!/bin/sh
if [ -f /src/app/etc/config.php ] || [ -f /src/app/etc/env.php ]; then
  echo "It appears Magento is already installed (app/etc/config.php or app/etc/env.php exist). Quitting setup..."
  exit
fi

echo "Downloading and untarring archive..."
curl -L https://storage.googleapis.com/mageinferno-docker-magento2-setup/magento-ce-2.0.0.tar.gz | tar xzf - -o -C /src
chmod +x /src/bin/magento

echo "Running Magento 2 setup script..."
/src/bin/magento setup:install \
  --db-host=$M2SETUP_DB_HOST \
  --db-name=$M2SETUP_DB_NAME \
  --db-user=$M2SETUP_DB_USER \
  --db-password=$M2SETUP_DB_PASSWORD \
  --base-url=$M2SETUP_BASE_URL \
  --admin-firstname=$M2SETUP_ADMIN_FIRSTNAME \
  --admin-lastname=$M2SETUP_ADMIN_LASTNAME \
  --admin-email=$M2SETUP_ADMIN_EMAIL \
  --admin-user=$M2SETUP_ADMIN_USER \
  --admin-password=$M2SETUP_ADMIN_PASSWORD

echo "Reindexing all indexes..."
/src/bin/magento indexer:reindex

echo "Applying ownership & proper permissions..."
sed -i 's/0770/0775/g' /src/vendor/magento/framework/Filesystem/DriverInterface.php
sed -i 's/0660/0664/g' /src/vendor/magento/framework/Filesystem/DriverInterface.php
find pub -type f -exec chmod 664 {} \;
find pub -type d -exec chmod 775 {} \;
find /src/var/generation -type d -exec chmod g+s {} \;
chown -R magento:www-data /src

echo "The setup script has completed execution."
