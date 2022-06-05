FROM iras/php:ubuntu-7.1

# install composer and git
RUN apt-get update && apt-get install --no-install-recommends -y git openssh-client \
 && mkdir /.composer && chmod 777 /.composer \
 && php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" \
 && php /tmp/composer-setup.php --install-dir=/usr/bin --filename=composer \
 && rm /tmp/composer-setup.php \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

VOLUME ["/composer/cache"]
ENV COMPOSER_CACHE_DIR /composer/cache
ENV COMPOSER_ALLOW_SUPERUSER 1
