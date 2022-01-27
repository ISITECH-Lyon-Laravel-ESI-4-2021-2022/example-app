FROM sail-8.1/app

COPY . /var/www/html

RUN chmod -R 777 storage bootstrap/cache

RUN composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist
