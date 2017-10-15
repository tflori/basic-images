FROM iras/php7:1.0

# install composer, ca-certificates, wget and bash
RUN apk add --no-cache \
        ca-certificates wget bash git && \
    update-ca-certificates && \
    wget "https://getcomposer.org/download/1.3.2/composer.phar" -O "/usr/bin/composer" && \
    chmod +x /usr/bin/composer && \
    mkdir /.composer && chmod 777 /.composer
