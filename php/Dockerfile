FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TIMEZONE=Europe/Berlin

RUN apt-get update && apt-get install --no-install-recommends --mark-auto -y \
    software-properties-common ca-certificates lsb-release apt-transport-https gpg-agent \
 && add-apt-repository -y ppa:ondrej/php \
 && apt-get update \
 && ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && apt-get install --no-install-recommends -y \
    php7.2-cli php7.2-amqp php7.2-apcu php7.2-ast php7.2-bcmath php7.2-bz2 php7.2-curl php7.2-dba \
    php7.2-decimal php7.2-gd php7.2-grpc php7.2-imap php7.2-intl php7.2-json php7.2-ldap \
    php7.2-mbstring php7.2-mcrypt php7.2-mysql php7.2-opcache php7.2-pgsql \
    php7.2-readline php7.2-redis php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xdebug php7.2-xml \
    php7.2-zip \
 && mkdir -p /var/lib/net-snmp/mib_indexes \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

RUN { echo '; Uncomment to enable this extension.'; \
      echo ';zend_extension=xdebug.so'; \
    } > /etc/php/7.2/mods-available/xdebug.ini
