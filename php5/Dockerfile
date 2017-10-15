FROM alpine:3.5

# install php5 with all modules (redis not available)
RUN apk add --no-cache \
        php5 php5-intl  php5-openssl  php5-sqlite3  php5-pdo_mysql  php5-pcntl  php5-common  php5-enchant  \
        php5-snmp  php5-xmlrpc  php5-xmlreader  php5-pdo_sqlite  php5-exif  php5-opcache  php5-posix  php5-gd  \
        php5-gettext  php5-json  php5-xml  php5  php5-iconv  php5-curl  php5-shmop  php5-odbc  php5-phar \
        php5-pdo_pgsql  php5-imap  php5-pdo_dblib  php5-pgsql  php5-pdo_odbc  php5-xdebug  php5-zip  php5-mcrypt \
        php5-bcmath  php5-calendar  php5-dom  php5-sockets  php5-soap  php5-zlib  php5-ftp  php5-pdo  php5-bz2 \
        php5-mysqli php5-ctype php5-mysql php5-pspell

# install php5 redis module
RUN apk add --no-cache php5-pear php5-dev autoconf make gcc libc-dev && \
    sed -i 's/\$PHP -C -n/$PHP -C/' /usr/bin/pecl && \
    pecl install -o -f redis && \
    echo "extension=redis.so" > /etc/php5/conf.d/redis.ini && \
    rm -rf /tmp/pear && \
    apk del --no-cache php5-pear php5-dev autoconf make gcc libc-dev
