FROM alpine:3.13

# install php7 with all modules
RUN apk add --no-cache \
        php8 php8-openssl php8-pdo php8-pdo_mysql php8-pdo_sqlite php8-pdo_pgsql php8-pdo_dblib php8-pdo_odbc \
        php8-intl php8-pcntl php8-mysqli php8-pgsql php8-pecl-redis php8-ctype php8-mbstring php8-exif php8-opcache \
        php8-gd php8-gettext php8-sqlite3 php8-pspell php8-snmp php8-xml php8-xmlreader php8-xmlwriter php8-simplexml \
        php8-posix php8-session php8-tokenizer php8-iconv php8-curl php8-shmop php8-odbc php8-phar php8-imap \
        php8-pdo_odbc php8-pecl-xdebug php8-zip php8-bcmath php8-calendar php8-tidy php8-dom php8-sockets \
        php8-soap php8-zlib php8-ftp php8-pdo php8-bz2 php8-fileinfo \
 && mkdir -p /var/lib/net-snmp/mib_indexes \
 && ln -s /usr/bin/php8 /usr/bin/php

