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
    php7.4-cli php7.4-amqp php7.4-apcu php7.4-ast php7.4-bcmath php7.4-bz2 php7.4-curl php7.4-dba \
    php7.4-decimal php7.4-gd php7.4-grpc php7.4-imap php7.4-intl php7.4-json php7.4-ldap \
    php7.4-mbstring php7.4-mcrypt php7.4-mysql php7.4-opcache php7.4-pgsql \
    php7.4-readline php7.4-redis php7.4-soap php7.4-sqlite3 php7.4-tidy php7.4-xdebug php7.4-xml \
    php7.4-zip php7.4-gmp \
 && mkdir -p /var/lib/net-snmp/mib_indexes \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

RUN { echo '; Uncomment to enable this extension.'; \
      echo ';zend_extension=xdebug.so'; \
    } > /etc/php/7.4/mods-available/xdebug.ini
