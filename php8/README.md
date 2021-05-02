# php8

This is just alpine with php8 installed. You can use it to run your php scripts:

```console
$ docker run --rm iras/php8 php --version
$ docker run --rm iras/php8 php -m
$ docker run --rm iras/php8 php -i
$ docker run --rm -v $(pwd):/app iras/php8 php /app/cli.php
```

The only extension installed and not enabled is the xdebug extension. When you need it in your image you could start
your Dockerfile like this:

```Dockerfile
FROM iras/php8

RUN echo 'zend_extension=xdebug.so' >> /etc/php7/conf.d/xdebug.ini
```
