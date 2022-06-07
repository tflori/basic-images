# php

This is just ubuntu with php installed. You can use it to run your php scripts:

```console
$ docker run --rm iras/php:ubuntu-7.3 php --version
$ docker run --rm iras/php:ubuntu-7.3 php -m
$ docker run --rm iras/php:ubuntu-7.3 php -i
$ docker run --rm -v $(pwd):/app iras/php:ubuntu-7.3 php /app/cli.php
```

The only extension installed and not enabled is the xdebug extension. When you need it in your image you could start
your Dockerfile like this:

```Dockerfile
FROM iras/php:ubuntu-7.3
RUN echo 'zend_extension=xdebug.so' >> /etc/php/7.3/mods-available/xdebug.ini
```
