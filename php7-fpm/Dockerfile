FROM iras/php7:1.0

ENV UID 33
ENV GID 33

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
      echo 'mkdir -p /var/log/php'; \
      echo 'chown -R $UID:$GID /var/log/php'; \
      echo ''; \
      echo 'ip address|grep inet6'; \
      echo 'if [ $? -ne 0 ]; then'; \
      echo '  sed -i "s/listen = 9000/listen = 0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf'; \
      echo 'fi'; \
      echo ''; \
      echo 'exec su-exec $UID:$GID php-fpm'; \
     } | tee /usr/local/bin/run.sh \
 && chmod +x /usr/local/bin/run.sh

EXPOSE 9000

CMD ["run.sh"]