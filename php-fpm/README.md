# php-fpm

Alpine image with php and fpm installed. Use this to build your php server image or run your dev environment directly
from this image:

```console
$ docker run --rm -ti -e UID=$(id -u) -v $(pwd):/var/www/localhost iras/php-fpm:7.3
```

## logging

As it is not running background the most log is found in stdout/stderr which you can get with `docker logs`. Other
errors are configured to be shown in the file `/var/log/php/php-error.log`. To avoid errors when changing the `UID`
environment variable the owner of the whole directory get changed to `$UID:$GID`.

## xdebug

When you are using this for development environment you might want to enable xdebug with remote debugging and connect
back.

Example xdebug.ini:

```ini
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
```

Example docker-compose.yml for development:

```yml
services:
  php:
    image: iras/php-fpm:7.3
    volumes:
      - ./:/app
      - ./provision/xdebug.ini:/etc/php7/conf.d/xdebug.ini
```
