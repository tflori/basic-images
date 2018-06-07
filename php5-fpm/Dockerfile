FROM iras/php5:1.0

ENV UID 333
ENV GID 333

VOLUME /var/www/localhost/htdocs
VOLUME /var/log/php

RUN apk add --no-cache php5-fpm su-exec

# configure php-fpm
RUN sed -i 's/^;daemonize = yes/daemonize = no/g' /etc/php5/php-fpm.conf \
 && sed -i 's/^error_log = \/var\/log\/php-fpm.log/error_log = log\/php\/php-error.log/g' /etc/php5/php-fpm.conf \
 && echo '[www]' > /etc/php5/fpm.d/www.conf \
 && sed '1,/\[www\]/d' /etc/php5/php-fpm.conf >> /etc/php5/fpm.d/www.conf \
 && sed -i 's/^listen = 127.0.0.1:9000/listen = 9000/g' /etc/php5/fpm.d/www.conf \
 && sed -i 's/^user =/;user =/g' /etc/php5/fpm.d/www.conf \
 && sed -i 's/^group =/;group =/g' /etc/php5/fpm.d/www.conf \
 && sed -i -n '/; Pool Definitions ;/q;p' /etc/php5/php-fpm.conf \
 && { echo '#!/bin/sh'; \
      echo ''; \
      echo 'addgroup -g $GID www-user'; \
      echo 'adduser -G www-user -D -u $UID www-user'; \
      echo 'mkdir -p /var/log/php'; \
      echo 'chown -R $UID:$GID /var/log/php'; \
      echo ''; \
      echo 'ip address|grep inet6'; \
      echo 'if [ $? -ne 0 ]; then'; \
      echo '  sed -i "s/listen = 9000/listen = 0.0.0.0:9000/g" /etc/php5/fpm.d/www.conf'; \
      echo 'fi'; \
      echo ''; \
      echo 'exec su-exec $UID:$GID php-fpm'; \
    } | tee /usr/local/bin/run.sh \
 && chmod +x /usr/local/bin/run.sh

EXPOSE 9000

CMD ["run.sh"]
