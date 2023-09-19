#!/bin/sh

cd src || exit

# Put the application into maintenance
php artisan down || true
git pull origin develop

# Install dependencies
composer install --optimize-autoloader --no-dev --ignore-platform-reqs
npm install

# Build node dependencies
npm run build

# Migrate database and seeding data
php artisan migrate
php artisan db:seed

# Clear all cache
php artisan view:clear
php artisan route:clear
php artisan config:clear

# Cache
php artisan view:cache
php artisan route:cache
php artisan config:cache

# Bring the application out of maintenance mode
php artisan up
