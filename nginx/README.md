# nginx

Alpine image with nginx installed.

## Environment configuration

### User and Group

By default the nginx server runs with user id 33 and group id 33. You should run it on an appropriate user by changing
the environment variable `UID` and `GID`.

### Document root

The document root is usually the only variable that needs to be changed in `/etc/nginx/conf.d/server.conf`. By default
it is set to `/var/www/localhost/htdocs` and can be changed with environment variable `DOCUMENT_ROOT`.

## Other configurations

By default the `http {}` block load `/etc/nginx/conf.d/*.conf`. In this image there is only a `server.conf` which
configures the `server {}` block with the `DOCUMENT_ROOT` and logging stuff. You should not change this. Instead you can
add files to `/etc/nginx/conf.d/server/*.conf` which is loaded in the `server {}` block. This way you can add aliases,
`location {}` blocks etc.

Example php.conf:

```nginx
location ~ [^/]\.php(/|$) {
  fastcgi_split_path_info ^(.+?\.php)(/.*)$;
  if (!-f $document_root$fastcgi_script_name) {
      return 404;
  }
  fastcgi_param HTTP_PROXY "";
  fastcgi_pass php:9000;
  fastcgi_index index.php;
  include fastcgi.conf;
}
```

Example try-files.conf:

```nginx
location / {
  try_files $uri /index.php$is_args$args;
}
```

Use it in your container:

```yml
services:
  nginx:
    image: iras/nginx
    environment:
      - "UID=1000"
      - "DOCUMENT_ROOT=/app/public"
    volumes:
      - ./public:/app/public
      - ./provision/nginx/server:/etc/nginx/conf.d/server
    depends_on:
      - php
```
