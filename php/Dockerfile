FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TIMEZONE=Europe/Berlin

RUN apt-get update && apt-get install --no-install-recommends --mark-auto -y \
    software-properties-common ca-certificates lsb-release apt-transport-https gpg-agent \
 && add-apt-repository -y ppa:ondrej/php \
 && apt-get update \
 && ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && apt-get install --no-install-recommends -y \
    php7.1-cli php7.1-amqp php7.1-apcu php7.1-ast php7.1-bcmath php7.1-bz2 php7.1-curl php7.1-dba \
    php7.1-decimal php7.1-gd php7.1-grpc php7.1-imap php7.1-intl php7.1-json php7.1-ldap \
    php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-pgsql \
    php7.1-readline php7.1-redis php7.1-soap php7.1-sqlite3 php7.1-tidy php7.1-xdebug php7.1-xml \
    php7.1-zip \
 && mkdir -p /var/lib/net-snmp/mib_indexes \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

RUN { echo '; Uncomment to enable this extension.'; \
      echo ';zend_extension=xdebug.so'; \
    } > /etc/php/7.1/mods-available/xdebug.ini
