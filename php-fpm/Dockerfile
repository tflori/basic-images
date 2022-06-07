FROM iras/php:ubuntu-7.4

ENV UID 333
ENV GID 333

VOLUME /var/www/localhost/htdocs
VOLUME /var/log/php

RUN apt-get update && apt-get install --no-install-recommends -y php7.4-fpm sudo \
 && apt-get clean autoclean && apt-get autoremove --yes && rm -Rf /var/lib/apt/lists/*

# configure php-fpm
RUN sed -i 's/^;daemonize = yes/daemonize = no/g' /etc/php/7.4/fpm/php-fpm.conf \
 && sed -i 's/^error_log = \/var\/log\/php7.4-fpm.log/error_log = \/var\/log\/php\/php-error.log/g' /etc/php/7.4/fpm/php-fpm.conf \
 && sed -i 's/^listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf \
 && sed -i 's/^user =/;user =/g' /etc/php/7.4/fpm/pool.d/www.conf \
 && sed -i 's/^group =/;group =/g' /etc/php/7.4/fpm/pool.d/www.conf \
 && phpdismod xdebug \
 && { echo '#!/bin/sh'; \
      echo 'set -e'; \
    } > /usr/local/bin/setup \
 && chmod +x /usr/local/bin/setup \
 && { echo '#!/bin/sh'; \
      echo ''; \
      echo 'if ! grep www-user /etc/passwd; then'; \
      echo '  addgroup --gid $GID www-user'; \
      echo '  adduser --system --ingroup www-user --uid $UID --disabled-password www-user'; \
      echo '  mkdir -p /var/log/php'; \
      echo 'fi'; \
      echo ''; \
      echo 'chown -R $UID:$GID /var/log/php /home/www-user /var/run/php'; \
      echo ''; \
      echo 'if ! ip address | grep inet6; then'; \
      echo '  sed -i "s/listen = 9000/listen = 0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf'; \
      echo 'fi'; \
      echo ''; \
      echo 'sudo -u www-user -g www-user setup && \'; \
      echo 'exec sudo -u www-user -g www-user php-fpm7.4 "$@"'; \
     } > /usr/local/bin/run \
 && chmod +x /usr/local/bin/run

EXPOSE 9000
CMD ["run"]
