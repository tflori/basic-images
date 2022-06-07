FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TIMEZONE=Europe/Berlin

RUN apt-get update && apt-get install --no-install-recommends --mark-auto -y \
    ca-certificates apt-transport-https gnupg2 \
 && echo 'deb https://ppa.launchpadcontent.net/ondrej/php/ubuntu/ jammy main' > /etc/apt/sources.list.d/ondrej-ubuntu-php.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C \
 && apt-get update \
 && ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && apt-get install --no-install-recommends -y \
    php8.0-cli php8.0-amqp php8.0-apcu php8.0-ast php8.0-bcmath php8.0-bz2 php8.0-curl php8.0-dba \
    php8.0-decimal php8.0-gd php8.0-grpc php8.0-imap php8.0-intl php8.0-ldap \
    php8.0-mbstring php8.0-mcrypt php8.0-mysql php8.0-opcache php8.0-pgsql \
    php8.0-readline php8.0-redis php8.0-soap php8.0-sqlite3 php8.0-tidy php8.0-xdebug php8.0-xml \
    php8.0-zip php8.0-gmp \
 && mkdir -p /var/lib/net-snmp/mib_indexes \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

RUN { echo '; Uncomment to enable this extension.'; \
      echo ';zend_extension=xdebug.so'; \
    } > /etc/php/8.0/mods-available/xdebug.ini
