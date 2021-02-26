FROM alpine:3.13

ENV UID 333
ENV GID 333
ENV DOCUMENT_ROOT /var/www/localhost/htdocs

# install nginx
RUN apk add --no-cache nginx su-exec

# configure nginx
RUN mkdir -p /run/nginx /var/log/httpd \
 && sed -i 's/^user nginx;/#user nginx;/g' /etc/nginx/nginx.conf \
 && sed -i 's/\/var\/log\/nginx/\/var\/log\/httpd/g' /etc/nginx/nginx.conf \
 && rm /var/lib/nginx/logs && ln -s /var/log/httpd /var/lib/nginx/logs \
 && rm /etc/nginx/conf.d/default.conf \
 && { \
        echo 'server {'; \
        echo '  listen 8080 default_server;'; \
        echo '  listen [::]:8080 default_server;'; \
        echo '  server_tokens off;'; \
        echo '  access_log  /var/log/httpd/access.log combined;'; \
        echo '  error_log   /var/log/httpd/error.log;'; \
        echo '  root /var/www/localhost/htdocs;'; \
        echo '  include /etc/nginx/conf.d/server/*.conf;'; \
        echo '}'; \
    } | tee /etc/nginx/conf.d/server.conf \
 && cp -r /var/lib/nginx /var/lib/nginx.bak \
 && rm -Rf /var/lib/nginx; mv /var/lib/nginx.bak /var/lib/nginx \
 && rm -Rf /var/lib/nginx/tmp; mkdir /var/lib/nginx/tmp

# configure run
RUN { \
        echo '#!/bin/sh'; \
        echo ''; \
        echo 'addgroup -g $GID www-user'; \
        echo 'adduser -G www-user -D -u $UID www-user'; \
        echo ''; \
        echo 'chown -R $UID:$GID /var/lib/nginx /var/log/httpd /run/nginx /home/www-user'; \
        echo ''; \
        echo 'ip address|grep inet6'; \
        echo 'if [ $? -ne 0 ]; then'; \
        echo '  sed -i "s/listen \[::\]:8080 default_server;//g" /etc/nginx/conf.d/server.conf'; \
        echo 'fi'; \
        echo ''; \
        echo 'if [ "$DOCUMENT_ROOT" != "/var/www/localhost/htdocs" ]; then'; \
        echo '  sed -i "s /var/www/localhost/htdocs $DOCUMENT_ROOT g" /etc/nginx/conf.d/server.conf'; \
        echo 'fi'; \
        echo ''; \
        echo 'exec su-exec $UID:$GID /usr/sbin/nginx -g "daemon off;"'; \
    } | tee /usr/local/bin/run.sh \
 && chmod +x /usr/local/bin/run.sh

EXPOSE 8080

CMD ["run.sh"]
