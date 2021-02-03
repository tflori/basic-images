FROM alpine:3.9

# install php7 with all modules
RUN apk add --no-cache \
        php7-intl php7-openssl php7-sqlite3 php7-pdo_mysql php7-pcntl php7-common php7-mysqlnd php7-pspell php7-pecl-redis \
        php7-ctype php7-snmp php7-mbstring php7-xmlrpc php7-xmlreader php7-pdo_sqlite php7-simplexml php7-mysqli \
        php7-exif php7-opcache php7-posix php7-session php7-gd php7-gettext php7-tokenizer php7-json php7-xml php7 \
        php7-iconv php7-curl php7-shmop php7-odbc php7-phar php7-pdo_pgsql php7-imap php7-pdo_dblib php7-pgsql \
        php7-pdo_odbc php7-xdebug php7-zip php7-mcrypt php7-bcmath php7-calendar php7-tidy php7-dom php7-sockets \
        php7-soap php7-zlib php7-ftp php7-pdo php7-bz2 php7-xmlwriter php7-fileinfo \
 && mkdir -p /var/lib/net-snmp/mib_indexes

