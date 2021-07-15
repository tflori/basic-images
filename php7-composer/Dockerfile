FROM iras/php7:4

VOLUME /composer

# install composer, ca-certificates and bash
RUN apk add --no-cache ca-certificates bash git openssh-client \
 && update-ca-certificates \
 && mkdir /.composer && chmod 777 /.composer \
 && php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" \
 && php /tmp/composer-setup.php --install-dir=/usr/bin --filename=composer \
 && rm /tmp/composer-setup.php
 && chmod 777 /composer

ENV COMPOSER_CACHE_DIR /composer/cache
ENV COMPOSER_ALLOW_SUPERUSER 1
