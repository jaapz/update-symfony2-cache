#!/bin/sh

# update-cache.sh - Rebuild Symfony2 cache and assets.
#
# This script removes the cache, and rebuilds it. After that it will also
# install assets again and rebuild all assets.
#
# Written by Jaap Broekhuizen and released under the terms of the MIT license.
#
# Usage: update-cache.sh [--prod]

prod=false

while getopts ":p" opt; do
    case $opt in
        p)
            prod=true
            ;;
    esac
done


# Rebuild cache
echo 'Removing cache...'
rm -rf ./app/cache/* > /dev/null 2>&1

echo 'Rebuilding cache...'
php app/console cache:warmup > /dev/null 2>&1

if $prod; then
    echo '  .. for production'
    php app/console cache:warmup --env=prod > /dev/null 2>&1
    php app/console cache:warmup --env=prod --no-debug > /dev/null 2>&1
fi

# Rebuild assets
echo 'Rebuilding assets...'
php app/console assets:install web > /dev/null 2>&1
php app/console assetic:dump web > /dev/null 2>&1

if $prod; then
    echo '  .. for production'
    php app/console assetic:dump web --env=prod > /dev/null 2>&1
    php app/console assetic:dump web --env=prod --no-debug > /dev/null 2>&1
fi
