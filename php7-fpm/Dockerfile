FROM iras/php7:3

ENV UID 333
ENV GID 333

VOLUME /var/www/localhost/htdocs
VOLUME /var/log/php

RUN apk add --no-cache php7-fpm su-exec \
 && ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm

# configure php-fpm
RUN sed -i 's/^;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf \
 && sed -i 's/^;error_log = log\/php7\/error.log/error_log = log\/php\/php-error.log/g' /etc/php7/php-fpm.conf \
 && sed -i 's/^listen = 127.0.0.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf \
 && sed -i 's/^user =/;user =/g' /etc/php7/php-fpm.d/www.conf \
 && sed -i 's/^group =/;group =/g' /etc/php7/php-fpm.d/www.conf \
 && { echo '#!/bin/sh'; \
      echo 'set -e'; \
    } > /usr/local/bin/setup \
 && chmod +x /usr/local/bin/setup \
 && { echo '#!/bin/sh'; \
      echo ''; \
      echo 'if ! grep www-user /etc/passwd; then'; \
      echo '  addgroup -g $GID www-user'; \
      echo '  adduser -G www-user -D -u $UID www-user'; \
      echo '  mkdir -p /var/log/php'; \
      echo '  chown -R $UID:$GID /var/log/php /home/www-user'; \
      echo 'fi'; \
      echo ''; \
      echo 'if ! ip address | grep inet6; then'; \
      echo '  sed -i "s/listen = 9000/listen = 0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf'; \
      echo 'fi'; \
      echo ''; \
      echo 'su-exec $UID:$GID setup && \'; \
      echo 'exec su-exec $UID:$GID php-fpm "$@"'; \
     } > /usr/local/bin/run \
 && chmod +x /usr/local/bin/run

EXPOSE 9000

CMD ["run"]
