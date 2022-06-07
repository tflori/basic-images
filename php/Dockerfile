FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TIMEZONE=Europe/Berlin

RUN apt-get update && apt-get install --no-install-recommends --mark-auto -y \
    software-properties-common ca-certificates lsb-release apt-transport-https gpg-agent \
 && add-apt-repository -y ppa:ondrej/php \
 && apt-get update \
 && ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && apt-get install --no-install-recommends -y \
    php7.3-cli php7.3-amqp php7.3-apcu php7.3-ast php7.3-bcmath php7.3-bz2 php7.3-curl php7.3-dba \
    php7.3-decimal php7.3-gd php7.3-grpc php7.3-imap php7.3-intl php7.3-json php7.3-ldap \
    php7.3-mbstring php7.3-mcrypt php7.3-mysql php7.3-opcache php7.3-pgsql \
    php7.3-readline php7.3-redis php7.3-soap php7.3-sqlite3 php7.3-tidy php7.3-xdebug php7.3-xml \
    php7.3-zip \
 && mkdir -p /var/lib/net-snmp/mib_indexes \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

RUN { echo '; Uncomment to enable this extension.'; \
      echo ';zend_extension=xdebug.so'; \
    } > /etc/php/7.3/mods-available/xdebug.ini
